import 'package:flutter/material.dart';
import 'weekly_forecast.dart';
import 'package:weather_now/services/weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? temp;

  int? temperature;
  int? humidity;
  double? speed;
  int? intSpeed;
  String? description;
  int? pressure;
  @override
  void initState() {
    // TODO: implement initState
    updateUi();
    super.initState();
  }

  void updateUi() async {
    Weather weather = Weather();
    var weatherData = await weather.getLocationWeather();
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        humidity = 0;
        intSpeed = 0;
        description = 'Unable to connect';
        return;
      }
      temp = weatherData['main']['temp'];
      temperature = temp!.toInt();
      humidity = weatherData['main']['humidity'];
      speed = weatherData['wind']['speed'];
      intSpeed = speed!.toInt();
      description = weatherData['weather'][0]['description'];
      pressure = weatherData['main']['pressure'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (temperature == null && humidity == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image(
              image: AssetImage('assets/images/sunny.jpeg'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            ),
          ],
        ),
      );
    } else
      return GestureDetector(
        onVerticalDragEnd: (details) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => WeeklyForecast(),
            ),
          );
          // Navigator.of(context).push(
          //   PageRouteBuilder(
          //       pageBuilder: (context, animation, anotherAnimation) {
          //         return WeeklyForecast();
          //       },
          //       transitionDuration: Duration(milliseconds: 200),
          //       transitionsBuilder:
          //           (context, animation, anotherAnimation, child) {
          //         return SlideTransition(
          //           position:
          //               Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
          //                   .animate(animation),
          //           child: child,
          //         );
          //       }),
          // );
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Image(
                image: AssetImage('assets/images/sunny.jpeg'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(top: 80.0, left: 40.0),
                child: Column(
                  children: [
                    Text(
                      'India',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '${temperature.toString()}°',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 300.0,
                top: 80.0,
                right: 20.0,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(width: 1.0, color: Colors.white),
                        color: Colors.white.withOpacity(0.3),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12.0,
                              spreadRadius: 12.0)
                        ]),
                    child: Center(
                      child: Text(
                        description!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 60.0,
                left: 20.0,
                right: 20.0,
                child: Container(
                  height: 80.0,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(width: 1.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 12.0,
                          spreadRadius: 12.0,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${humidity.toString()}%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'Humidity',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${intSpeed.toString()}km/h',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'Wind',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${pressure.toString()}Pa',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'Pressure',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
