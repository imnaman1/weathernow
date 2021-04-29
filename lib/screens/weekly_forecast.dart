import 'package:flutter/material.dart';
import 'package:weather_now/services/daily_data_service.dart';
import 'package:intl/intl.dart';

class WeeklyForecast extends StatefulWidget {
  @override
  _WeeklyForecastState createState() => _WeeklyForecastState();
}

class _WeeklyForecastState extends State<WeeklyForecast> {
  final DailyDataService dailyDataService = DailyDataService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dailyDataService.fetchDailyWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: dailyDataService.fetchDailyWeather(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/sunny.jpeg'),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            dynamic data = snapshot.data![index];
                            var date = new DateTime.fromMicrosecondsSinceEpoch(
                                data.dt * 1000000);
                            var formattedDate = DateFormat.yMMMd().format(date);
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: 200.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                        width: 1.0, color: Colors.white),
                                    color: Colors.white.withOpacity(0.2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 12.0,
                                          spreadRadius: 12.0)
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${formattedDate.toString()}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.center,
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: Colors.white,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${data.humidity.toString()} %',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                'Humidity',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          VerticalDivider(
                                            color: Colors.white,
                                            thickness: 2.0,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${data.pressure.toString()} Pa',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                'Pressure',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          VerticalDivider(
                                            color: Colors.white,
                                            thickness: 2.0,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${data.temp.day.toString()}°',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                'Temp',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 82.0,
              ),
            );
          }
          return Stack(
            children: [
              Image(
                image: AssetImage('assets/images/sunny.jpeg'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
