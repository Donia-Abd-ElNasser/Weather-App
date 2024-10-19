import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_Weather_Cubit/GetWeatherCubit.dart';
import 'package:weatherapp/Models/weatherModel.dart';
import 'package:weatherapp/Services/weatherServices.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 57, 102),
        title: const Text(
          'Search City',
        ),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (value) async {
        
             var getweathercubit =    BlocProvider.of<GetWeatherCubit>(context);
             getweathercubit.GetWeather(cityName: value);
           Navigator.pop(context);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
             // borderSide: BorderSide(color: Colors.blue),
            ),
            hintText: 'Enter Your City',
            contentPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
            labelText: 'Search',
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

