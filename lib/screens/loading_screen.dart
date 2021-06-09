import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/services/location.dart';
import '/services/networking.dart';
import '/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'feff25eec28b789631d9b2764d47baeb';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationWeather();

    super.initState();
  }

  void getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getWeather();

    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
        child: SpinKitFoldingCube(
          color: Colors.blue,
        ),
      )),
    );
  }
}
