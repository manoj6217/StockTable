using Microsoft.AspNet.SignalR;
using Microsoft.AspNetCore.SignalR.Client;
//using Microsoft.AspNetCore.SignalR.Client;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockTestWPF.Models
{
    public class FetchUpdateStockModel : Hub
    {
        Action<StockUpdate> _updateStock;

        private string _baseUrl = "https://js.devexpress.com/Demos/NetCore/liveUpdateSignalRHub";
        public void StartHub(Action<StockUpdate> updateStock)
        {
            _updateStock = updateStock;
            var _hubConnection = new HubConnectionBuilder().WithUrl(_baseUrl).Build();
            _hubConnection.On<StockUpdate>("updateStockPrice", data =>
            {
                if (_updateStock != null)
                    _updateStock(data);
                Console.WriteLine(data.ToJson());
            });
            try
            {
                _hubConnection.StartAsync().Wait();
                Console.WriteLine("State " + _hubConnection.State);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToJson());
                throw;
            }

        }
    }

    public class StockUpdate
    {
        public string Symbol { get; set; }
        public double Price { get; set; }
        public double Change { get; set; }
    }


    public static class JsonExtesntions
    {
        public static string ToJson(this object obj)
        {
            try
            {
                var res = JsonConvert.SerializeObject(obj, new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    DateTimeZoneHandling = DateTimeZoneHandling.Local,
                    ContractResolver = new DefaultContractResolver { NamingStrategy = new CamelCaseNamingStrategy() },
                });
                return res;
            }
            catch (Exception e)
            {
                return $"error convert to json: {obj}, excption:{e.ToJson()}";
            }
        }
        public static string ToJson(this Exception ex)
        {
            var res = new Dictionary<string, string>()
            {
                {"Type",ex.GetType().ToString()},
                {"Message",ex.Message},
                {"StackTrace",ex.StackTrace}
            };
            return res.ToJson();
        }
    }
}
