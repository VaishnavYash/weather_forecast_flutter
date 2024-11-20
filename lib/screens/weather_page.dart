import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_forecast/services/state_management/management.dart';
import 'package:weather_forecast/services/state_management/provider.dart';
import 'package:weather_forecast/widgets/sample_widget.dart';
import 'package:weather_forecast/widgets/weather_card.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({
    super.key,
    required this.cityName,
  });

  final Provider weatherStore = Provider();
  final Management listStore = Management();
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    String loading = 'Loading...';
    weatherStore.cityName = cityName!;
    weatherStore.updateDataFromName();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          listStore.refreshData;
          return Future.delayed(const Duration(seconds: 2));
        },
        child: Observer(
          builder: (context) {
            DateTime? timeOfPlace =
                weatherStore.weatherData?.currentTime?.realTime;
            if (weatherStore.isLoading) {
              return SizedBox(
                child: Center(
                  child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: const Color(0xFF1A1A3F),
                    rightDotColor: const Color(0xFFEA3799),
                    size: 50,
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Card(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('hh:mm').format(timeOfPlace!) +
                                  (timeOfPlace.hour >= 12 ? ' PM' : ' AM'),
                            ),
                            if (timeOfPlace.hour < 6 || timeOfPlace.hour > 18)
                              Image.asset(
                                'time_icon/night.png',
                                width: 70,
                              )
                            else if (timeOfPlace.hour < 12)
                              Image.asset(
                                'time_icon/morning-png',
                                width: 70,
                              )
                            else if (timeOfPlace.hour < 18)
                              Image.asset(
                                'time_icon/sunset.png',
                                width: 70,
                              )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'others/nav_icon.png',
                                  width: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '''${weatherStore.weatherData?.location!.name}, ${weatherStore.weatherData?.location?.region}''',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      weatherStore
                                              .weatherData?.location!.country ??
                                          loading,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.black,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              height: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SampleWidget().imageAndText(
                                    'others/sunrise_other.png', 'sunrise time'),
                                SampleWidget().imageAndText(
                                    'others/sunset_other.png', 'sunset time'),
                                SampleWidget().imageAndText('temp.png',
                                    '${weatherStore.weatherData?.current?.tempC} C'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        WeatherCard(
                          iconString: 'cloud.png',
                          subtitle: '',
                          title: weatherStore
                                  .weatherData?.current?.condition?.text ??
                              loading,
                        ),
                        WeatherCard(
                          iconString: 'humidity.png',
                          subtitle: 'Percentage',
                          title: weatherStore.weatherData?.current?.humidity
                                  ?.toString() ??
                              loading,
                        ),
                        WeatherCard(
                          iconString: 'outside_temp.png',
                          subtitle: 'Feel like Temperature',
                          title: weatherStore.weatherData?.current?.feelslikeC
                                  ?.toString() ??
                              loading,
                        ),
                        WeatherCard(
                          iconString: 'wind.png',
                          subtitle: 'Speed (MpH)',
                          title: weatherStore.weatherData?.current?.windMph
                                  ?.toString() ??
                              loading,
                        ),
                      ],
                    ),
                    Card(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Pressure: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'pressure.png',
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Pressure (mB): ${weatherStore.weatherData?.current?.pressureIn.toString()}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Pressure (in): ${weatherStore.weatherData?.current?.pressureMb.toString()}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
