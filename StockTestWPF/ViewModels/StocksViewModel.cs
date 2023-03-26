using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Threading;
using StockTestWPF.Data;
using StockTestWPF.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace StockTestWPF.ViewModels
{
    public class StocksViewModel : ViewModelBase
    {
        private StockUpdatesService _stockUpdatesService;
        private FetchUpdateStockModel _fetchStockUpdatesService;
        //private bool _isInitialLoad { get; set; }

        



        private ObservableCollection<StockUpdateModel> _stocksList;

        public ObservableCollection<StockUpdateModel> StocksList
        {
            get { return _stocksList; }
            set { Set(ref _stocksList, value); }
        }



        public StocksViewModel()
        {

            _stockUpdatesService = new StockUpdatesService();
            _fetchStockUpdatesService = new FetchUpdateStockModel();
            
            LoadData();


            _fetchStockUpdatesService.StartHub(UpdateStocks);


        }

       

        private void LoadData()
        {
            var list = _stockUpdatesService.GetStocks();

            if (StocksList != null)
            {
                StocksList.Clear();
                StocksList = null;
            }
            StocksList = new ObservableCollection<StockUpdateModel>();
            var templist = new ObservableCollection<StockUpdateModel>();

            if (list != null && list.Any())
            {                
                foreach (var item in list)
                {
                    if (item != null)
                    {
                        StockUpdateModel model = new StockUpdateModel();
                        model.StockId = item.StockId;
                        model.Symbol = item.StockSymbol;

                        model.IsRisingStockSelected = (model.Price < Convert.ToDouble(item.Price));

                        model.Price = Convert.ToDouble(item.Price);
                        model.Change = Convert.ToDouble(item.Change);
                        model.UpdatedTime = DateTime.Now.ToLongTimeString();


                        templist.Add(model);
                    }
                }

                if (templist != null && templist.Any())
                {
                    StocksList = templist;
                }
            }

        }


        private void UpdateStocks(StockUpdate stockUpdate)
        {
            if(stockUpdate != null)
            {
                if (StocksList != null)
                {
                    bool isAddRecord = false;
                    StockUpdateModel mstStk = null;
                    if (StocksList.Any())
                    {
                        mstStk = StocksList.FirstOrDefault(x => Equals(x.Symbol, stockUpdate.Symbol));
                    }

                    if (mstStk == null)
                    {
                        mstStk = new StockUpdateModel();
                        mstStk.Symbol = stockUpdate.Symbol;
                        isAddRecord = true;
                    }

                    mstStk.IsRisingStockSelected = (mstStk.Price < Convert.ToDouble(stockUpdate.Price));
                    mstStk.ChangePercent = (stockUpdate.Change / mstStk.Price) * 100;

                    mstStk.Price = stockUpdate.Price;
                    mstStk.Change = stockUpdate.Change;
                    mstStk.UpdatedTime = DateTime.Now.ToLongTimeString();                    

                    bool isaddUpdate = _stockUpdatesService.AddEditStocks(mstStk);

                    if (isAddRecord)
                    {
                        //DispatcherHelper.CheckBeginInvokeOnUI(() =>
                        //{
                            var list = StocksList.ToList();
                            var newList = new ObservableCollection<StockUpdateModel>();

                            if (list != null)
                            {
                                if (list.Any())
                                {
                                    foreach (var item in list)
                                    {
                                        if (item != null)
                                        {
                                            newList.Add(item);
                                        }
                                    }
                                }

                                if(mstStk != null)
                                {
                                    newList.Add(mstStk);
                                }
                            }

                            if (newList != null && newList.Any())
                            {
                                StocksList = newList;
                            }
                        //});
                        //StocksList.Add(mstStk);
                    }
                }
            }
        }
    }
}
