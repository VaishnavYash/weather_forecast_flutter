import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_forecast/services/location_services/api_call.dart';
import 'package:weather_forecast/services/state_management/favourite.dart';
import 'package:weather_forecast/services/state_management/management.dart';
import 'package:weather_forecast/widgets/swipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchBoxTextController = TextEditingController();
  final cityListProvider = Management();
  final favListProvider = Favourite();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Observer(
                builder: (context) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchBoxTextController,
                          style: const TextStyle(color: Colors.white),
                          decoration:
                              const InputDecoration(label: Text('Title')),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          cityListProvider.addCityName =
                              searchBoxTextController.text.toLowerCase();
                          if (searchBoxTextController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('No City name entered'),
                            ));
                          } else if (cityListProvider
                              .checkCity(cityListProvider.addCityName)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('City is already in the list'),
                            ));
                          } else {
                            searchBoxTextController.clear;
                            cityListProvider
                                .updateList(cityListProvider.addCityName);
                            if (weatherStore.isException) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Enter correct city Name'),
                              ));
                              weatherStore.isException = false;
                            }
                          }
                        },
                        label: const Icon(Icons.add, size: 20),
                      ),
                    ],
                  );
                },
              ),
            ),
            ExpansionTile(
              title: const Text('Favourites'),
              children: [
                Observer(
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: favListProvider.favListLength,
                      itemBuilder: (context, index) {
                        var keys = favListProvider.favList.keys.toList();
                        var cityData = favListProvider.favList[keys[index]];
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            color: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star_outlined),
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.delete),
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            String removedCity = keys[index];
                            favListProvider.removeFavWeatherData(keys[index]);
                            if (direction == DismissDirection.endToStart) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text('City Deleted'),
                                action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      cityListProvider.updateList(removedCity);
                                    }),
                              ));
                            } else {
                              cityListProvider.updateList(removedCity);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Removed from Favourite')));
                            }
                          },
                          child: WeatherSwipeCard(cityData: cityData),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('All'),
              enabled: true,
              children: [
                Observer(
                  builder: (context) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        cityListProvider.refreshData();
                        return Future.delayed(const Duration(seconds: 2));
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cityListProvider.totallength,
                        itemBuilder: (context, index) {
                          var keys = cityListProvider.cityList.keys.toList();
                          var cityData = cityListProvider.cityList[keys[index]];
                          return Dismissible(
                            key: UniqueKey(),
                            background: Container(
                              color: Colors.green,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.star),
                                ],
                              ),
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.delete),
                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              String removedCity = keys[index];
                              cityListProvider.removeWeatherData(keys[index]);
                              if (direction == DismissDirection.endToStart) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: const Text('City Deleted'),
                                  action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        cityListProvider
                                            .updateList(removedCity);
                                      }),
                                ));
                              } else {
                                favListProvider.updateFavList(removedCity);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Added to Favourite')));
                              }
                            },
                            child: WeatherSwipeCard(cityData: cityData),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
