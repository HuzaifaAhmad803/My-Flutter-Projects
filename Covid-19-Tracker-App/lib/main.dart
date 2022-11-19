import 'package:covid_tracker/View/countries_list_screen.dart';
import 'package:covid_tracker/View/country_state_screen.dart';
import 'package:covid_tracker/View/new_screen.dart';
import 'package:covid_tracker/View/splash_screen.dart';
import 'package:covid_tracker/View/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'SplashScreen',
      routes: {
        'SplashScreen': (context) => const SplashScreen(),
        'HomeScreen': (context) => const HomeScreen(),
        'CountriesListScreen': (context) => const CountriesListScreen(),
        'NewScreen': (context) => const NewScreen(),
        'CountryStateScreen': (context) => CountriesStateScreen()
      },
      home: const SplashScreen(),
    );
  }
}

