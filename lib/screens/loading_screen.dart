import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';

const apiKey = '22d2ba0ba4ad7d1a403f55f793c17bc1';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // void getLocationData() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //   latitude = location.latitude;
  //   longitude = location.longitude;

  //   NetworkHelper networkHelper = NetworkHelper(
  //     url:
  //         'https://api.openweathermap.org/data/2.5/weather?lat=7.5675675675675675&lon=110.78472759533072&appid=22d2ba0ba4ad7d1a403f55f793c17bc1&units=metric',
  //   );

  //   var weatherData = await networkHelper.getData();

  //   if (!mounted) return;
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LocationScreen(
  //         locationWeather: weatherData,
  //       ),
  //     ),
  //   );
  // }
  void getLocationData() async {
  var weatherData = await WeatherModel().getLocationWeather();

  if (!mounted) return;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LocationScreen(
        locationWeather: weatherData,
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
        ),
      ),
    );
  }
}
