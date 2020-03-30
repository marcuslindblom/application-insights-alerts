namespace ApplicationInsightsAlerts
{
  using Newtonsoft.Json;

  public partial class PurpleException
    {
        [JsonProperty("tables")]
        public Table[] Tables { get; set; }
    }

    public partial class Table
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("columns")]
        public Column[] Columns { get; set; }

        [JsonProperty("rows")]
        public string[][] Rows { get; set; }
    }

    public partial class Column
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("type")]
        public string Type { get; set; }
    }

}
