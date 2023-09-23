class WeatherModel {
  String CityName;
  String LastDate;
  String Temp;
  String MaxTemp;
  String MinTemp;
  String WeatherCondition;
  String Image;

  WeatherModel(
      {required this.CityName,
      required this.LastDate,
      required this.Temp,
      required this.MaxTemp,
      required this.MinTemp,
      required this.WeatherCondition,
      required this.Image});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        CityName: json["location"]["name"],
        LastDate: json["current"]["last_updated"],
        Temp: json["forecast"]["forecastday"][0]["avgtemp_c"],
        MaxTemp: json["forecast"]["forecastday"][0]["maxtemp_c"],
        MinTemp:json["forecast"]["forecastday"][0]["mintemp_c"] ,
        WeatherCondition:json["forecast"]["forecastday"][0]["condition"]["text"],
        Image: json["forecast"]["forecastday"][0]["condition"]["icon"],);
  }
}
