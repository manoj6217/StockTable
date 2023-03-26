using GalaSoft.MvvmLight;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockTestWPF.Models
{
    public class StockUpdateModel : ViewModelBase
    {

        private int _stockId;
        public int StockId
        {
            get { return _stockId; }
            set { Set(ref _stockId, value); }
        }

        private string _symbol;
        public string Symbol
        {
            get { return _symbol; }
            set { Set(ref _symbol, value); }
        }

        private double _price;
        public double Price
        {
            get { return _price; }
            set { Set(ref _price, value); }
        }

        private double _change;
        public double Change
        {
            get { return _change; }
            set { Set(ref _change, value); }
        }

        private double _changePercent;
        public double ChangePercent
        {
            get { return _changePercent; }
            set { Set(ref _changePercent, value); }
        }

        private string _updatedTime;
        public string UpdatedTime
        {
            get { return _updatedTime; }
            set { Set(ref _updatedTime, value); }
        }

        private bool _isRisingStockSelected;
        public bool IsRisingStockSelected
        {
            get { return _isRisingStockSelected; }
            set
            {
                Set(ref _isRisingStockSelected, value);
            }
        }
    }
}
