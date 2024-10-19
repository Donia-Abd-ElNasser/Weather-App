import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_Weather_Cubit/GetWatherStates.dart';
import 'package:weatherapp/Cubits/get_Weather_Cubit/GetWeatherCubit.dart';

import 'package:weatherapp/screens/NoWeatherScreen.dart';
import 'package:weatherapp/screens/SearchScreen.dart';
import 'package:weatherapp/screens/WeatherScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 75, 91, 126),
        appBar: AppBar(
        backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchScreen();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.search)),
          ],
          title: const Text(
            'WeatherApp',
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoWeatherScreen();
            } else if (state is WeatherLoadedState)
              return WeatherScreen(
                weather: state.weathermodel,
              );
            else
              return const Text('oops! ,there was an error');
          },
        ));
  }
}
