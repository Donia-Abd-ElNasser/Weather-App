import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_Weather_Cubit/GetWatherStates.dart';
import 'package:weatherapp/Models/weatherModel.dart';
import 'package:weatherapp/Services/weatherServices.dart';

class GetWeatherCubit extends Cubit <WeatherState>{
  GetWeatherCubit():super(WeatherInitialState());
  Weathermodel? weathermodel;
 GetWeather({required String cityName})async{
try{
  weathermodel =
                await WeatherServices(dio: Dio()).getCurrentWeather(cityName: cityName);
                emit(WeatherLoadedState(weathermodel!));
 }
 catch(e){
emit(WeatherFailureState(error:  e.toString()));

 }

}}