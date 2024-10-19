import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_Weather_Cubit/GetWeatherCubit.dart';
import 'package:weatherapp/Models/weatherModel.dart';
import 'package:weatherapp/main.dart';
const AppColor=Color.fromARGB(255, 3, 57, 102); 
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.weather});
  final Weathermodel weather;
  @override
  Widget build(BuildContext context) {
    Weathermodel weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weathermodel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
             getThemeColor(weathermodel.weatherCondition)[700]!,
        getThemeColor(weathermodel.weatherCondition),
        getThemeColor(weathermodel.weatherCondition)[300]!,
        getThemeColor(weathermodel.weatherCondition)[50]!,
      ],begin: Alignment.topCenter,end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: const TextStyle(
                color: AppColor,
                fontWeight: FontWeight.bold,
                fontSize: 29,
              ),
            ),
             Text(
                  weathermodel.avgTemp.toString(),
                  style: const TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
            Text(
              'Updated at ${weathermodel.date.hour}:${weathermodel.date.minute} ',
              style: const TextStyle(
                color:AppColor,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weathermodel.weatherCondition,
              style:  TextStyle(
                color: AppColor,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' H : ${weathermodel.maxTemp.round()}',
                  style: const TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 29,
                  ),
                ),
                Text(
                  'L : ${weathermodel.minTemp.round()}',
                  style: const TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
