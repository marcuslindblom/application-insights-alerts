using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;

namespace ApplicationInsightsAlerts
{
  class Program
    {
        const string URL = "https://api.applicationinsights.io/v1/apps/{0}/{1}?{2}={3}&{4}={5}";
        static void Main(string[] args)
        {
            try
            {
                HttpClient client = new HttpClient();
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                client.DefaultRequestHeaders.Add("x-api-key", args[1]);
                var req = string.Format(URL, args[0], "query", "query", args[2], "timespan", args[3]);
                HttpResponseMessage response = client.GetAsync(req).Result;
                if (response.IsSuccessStatusCode)
                {
                    var result = JsonConvert.DeserializeObject<PurpleException>(response.Content.ReadAsStringAsync().Result);
                    var output = new List<Output>();
                    foreach(var table in result.Tables) {
                        foreach(var row in table.Rows) {
                            if(row.Length > 0) {
                                output.Add(new Output { TimeStamp = DateTime.Parse(row[0]) , ExceptionType = row[3], Method = row[6], Message = row[8], Assembly = row[5] });
                            }
                        }
                    }
                    Console.WriteLine(JsonConvert.SerializeObject( output, Formatting.Indented ));
                }
                else
                {
                    Console.WriteLine(response.ReasonPhrase);
                }
            }
            catch (System.Exception)
            {
                throw;
            }
        }
    }
}
