import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final DateTime now = DateTime.now();
  String date = DateFormat("MMMM dd").format(DateTime.now());
  String day = DateFormat("EEEE").format(DateTime.now());
  String time = DateFormat("jm").format(DateTime.now());

  int? avgTemp;
  int? minTemp;
  int? maxTemp;
  int? avgPressure;
  int? humidity;

  int? windDirection;
  String? time1;
  String? time2;

  double? windSpeed;
  String? cityName;
  String? description;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    //temp
    double temperature = weatherData['main']['temp'];
    avgTemp = temperature.toInt();
    double mintemperature = weatherData['main']['temp_min'];
    minTemp = mintemperature.toInt();
    double maxtemperature = weatherData['main']['temp_max'];
    maxTemp = maxtemperature.toInt();

    // //pressure
    avgPressure = weatherData['main']['pressure'];

    //humidity
    humidity = weatherData['main']['humidity'];

    // //wind
    windSpeed = weatherData['wind']['speed'];
    windDirection = weatherData['wind']['deg'];

    // //
    cityName = weatherData['name'];
    String desc = weatherData['weather'][0]['description'];
    description = desc.toUpperCase();

    var timemorn = weatherData['sys']['sunrise'];
    time1 = timemorn.toString();

    print(humidity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF081B25),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.cloud),
            SizedBox(
              width: 20,
            ),
            Text("YOUR WEATHER")
          ],
        ),
      ),
      body: Column(
        children: [
          //searchbar
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$day",
                        style: kTextStyleLabel,
                      ),
                      Text(
                        "$time",
                        style: kdatestyle,
                      ),
                      Text(
                        "$date",
                        style: kdatestyle,
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          updateUI(widget.locationWeather);
                        });
                      },
                      icon: Icon(
                        FontAwesomeIcons.redo,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),

          //maininfo
          Expanded(
            flex: 5,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: ReusableContainer(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$cityName",
                            style: kTextStyleLabel,
                          ),
                          Text(
                            "$avgTemp °C",
                            style: kTextStyleLabel,
                          ),
                          Chip(
                              backgroundColor: Colors.blue,
                              label: Text(
                                "$description",
                                style: kChipLabel,
                              ))
                        ],
                      ),
                      Icon(
                        FontAwesomeIcons.cloudMoonRain,
                        size: 65,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidSun,
                            size: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "  Sunrise",
                                style: kChipLabel,
                              ),
                              Text(
                                "   5:05 Am",
                                style: kChipLabel,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidMoon,
                            size: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "  Sunset",
                                style: kChipLabel,
                              ),
                              Text(
                                "   6:45 Pm",
                                style: kChipLabel,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: ReusableContainer(CardContent(
                    "Temperature",
                    " ⬇️ $minTemp °C",
                    "⬆️  $maxTemp °C",
                    Icon(
                      Icons.thermostat,
                      size: 50,
                    ),
                  ))),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: ReusableContainer(Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Pressure",
                        style: kChipLabel,
                      ),
                      Icon(
                        Icons.compress,
                        size: 50,
                      ),
                      Text(
                        '$avgPressure hPa',
                        style: kdatestyle,
                      )
                    ],
                  ))),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: ReusableContainer(CardContent(
                    "Wind",
                    " $windDirection °",
                    "$windSpeed m/s",
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 50,
                    ),
                  ))),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: ReusableContainer(Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Humididty",
                        style: kChipLabel,
                      ),
                      Icon(
                        FontAwesomeIcons.bolt,
                        size: 50,
                      ),
                      Text(
                        '$humidity %',
                        style: kdatestyle,
                      )
                    ],
                  ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
