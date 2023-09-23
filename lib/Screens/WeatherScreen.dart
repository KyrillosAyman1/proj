import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/Models/WeatherModel.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherModel weatherModel;
  Dio dio = Dio();
  bool isloding = true;

  @override
  void initstate() {
    super.initState();
    getwheatherdata();
  }

  Future<void> getwheatherdata() async {
    Response response = await dio.get(
        "http://api.weatherapi.com/v1/forecast.json?key=dbe28a8e1c0f4950b40105509232009&q=Sohag&days=1&aqi=no&alerts=no");

    weatherModel = WeatherModel.fromjson(response.data);
    setState(() {});
    isloding = false;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      body: isloding
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weatherModel.CityName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'updated at ${weatherModel.LastDate}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https:${weatherModel.Image}",
                        height: 100,
                      ),
                      Text(
                        '${weatherModel.Temp} °C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Maxtemp: ${weatherModel.MaxTemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Mintemp: ${weatherModel.MinTemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '${weatherModel.WeatherCondition}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
