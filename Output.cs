using System;

namespace ApplicationInsightsAlerts {
  public class Output {
    public DateTime TimeStamp { get; set; }
    public string ExceptionType { get; set; }
    public string Method { get;set; }
    public string Message { get;set; }
    public string Assembly { get;set; }
  }
}