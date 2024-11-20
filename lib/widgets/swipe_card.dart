import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/data/weather.dart';
import 'package:weather_forecast/screens/weather_page.dart';

class WeatherSwipeCard extends StatelessWidget {
  const WeatherSwipeCard({
    super.key,
    required this.cityData,
  });

  final WeatherData? cityData;

  @override
  Widget build(BuildContext context) {
    DateTime? timeOfPlace = cityData?.currentTime?.realTime;

    timeOfPlace ??= DateTime.now();

    String imageString = '';
    if (timeOfPlace.hour >= 12 && timeOfPlace.hour < 17) {
      imageString = 'weather/good_weather. jpg';
    } else if (timeOfPlace.hour >= 17 && timeOfPlace.hour < 20) {
      imageString = 'weather/sunset_image.jpg';
    } else if (timeOfPlace.hour >= 20 || timeOfPlace.hour < 6) {
      imageString = 'weather/night_image.jpg';
    } else {
      imageString = 'weather/sunrise_image.jpg';
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                WeatherPage(cityName: cityData?.location?.name),
          ),
        );
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(imageString).image,
            opacity: 0.6,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Observer(builder: (context) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.transparent,
            elevation: 0,
            borderOnForeground: false,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cityData?.location?.name ?? 'Loading....',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('hh: mm').format(timeOfPlace!) +
                            (timeOfPlace.hour >= 12 ? ' PM' : ' AM'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cityData?.current?.condition?.text ?? 'Loading...',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${cityData?.current?.feelslikeC.toString()} \u2103',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
