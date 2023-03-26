using StockTestWPF.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace StockTestWPF.Models
{
    public class StockUpdatesService
    {
        #region Private Properties
        StocksUpdateDBEntities dBEntities;

        #endregion

        #region Constructor
        public StockUpdatesService()
        {

        }

        #endregion

        #region Methods
        public List<Mst_Stocks> GetStocks()
        {
            List<Mst_Stocks> companyList = new List<Mst_Stocks>();
            try
            {
                using (dBEntities = new StocksUpdateDBEntities())
                {
                    //var companyListQuery = dBEntities.Mst_Stocks.Distinct().OrderBy(x => x.StockSymbol).OrderByDescending(x => x.UpdatedDate).ToList();
                    var allData = dBEntities.Mst_Stocks.ToList();
                    var symbolList = allData.Select(x => x.StockSymbol).Distinct().ToList();

                    foreach (var symbol in symbolList)
                    {
                        var data = allData.Where(x => Equals(symbol, x.StockSymbol)).OrderByDescending(x => x.UpdatedDate).FirstOrDefault();

                        if (data != null)
                        {
                            companyList.Add(data);
                        }
                    }

                    //if (companyListQuery != null && companyListQuery.Any())
                    //{
                    //    companyList.AddRange(companyListQuery);
                    //}
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return companyList;
        }

        //public Mst_Company GetCompanyById(int companyId)
        //{
        //    Mst_Company companyObj = new Mst_Company();
        //    try
        //    {
        //        if (companyId > 0)
        //        {
        //            using (dBEntities = new CapitalDBEntities())
        //            {
        //                var companyQuery = dBEntities.Mst_Company.FirstOrDefault(x => x.CompanyId == companyId);

        //                if (companyQuery != null)
        //                {
        //                    companyObj = companyQuery;
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    return companyObj;
        //}

        public bool AddEditStocks(StockUpdateModel stock)
        {
            int noofRowsAffected = -1;
            try
            {
                if (stock != null)
                {
                    using (dBEntities = new StocksUpdateDBEntities())
                    {
                        List<Mst_Stocks> _stockObjList = null;
                        if (!string.IsNullOrWhiteSpace(stock.Symbol))
                        {
                            _stockObjList = dBEntities.Mst_Stocks.Where(x => x.StockSymbol == stock.Symbol).ToList();
                        }

                        if (_stockObjList != null)
                        {
                            Mst_Stocks addObj = null;
                            if (_stockObjList.Count() < 10)
                            {
                                //add stocks
                                addObj = new Mst_Stocks();                            }
                            else
                            {
                                //update old records 
                                addObj = _stockObjList.OrderBy(x => x.UpdatedDate).FirstOrDefault();
                            }

                            addObj.StockSymbol = stock.Symbol;
                            addObj.Price = Convert.ToDecimal(stock.Price);
                            addObj.Change = Convert.ToDecimal(stock.Change);
                            addObj.UpdatedDate = DateTime.Now;

                            if (stock.StockId == 0)
                            {
                                dBEntities.Mst_Stocks.Add(addObj);
                            }

                            noofRowsAffected = dBEntities.SaveChanges();
                        }

                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return noofRowsAffected > -1;
        }

        #endregion
    }
}
