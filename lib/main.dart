import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.red,
  brightness: Brightness.dark,
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
      ),
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
      home: const HomePage(),
    );
  }
}
