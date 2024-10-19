

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/Models/weatherModel.dart';

class WeatherServices {
  final Dio dio;
final String BaseUrl='https://api.weatherapi.com/v1';
final String apiKey='ca5faeb9796d44548c7141714241809';
  WeatherServices({required this.dio});
  Future<Weathermodel> getCurrentWeather({required String cityName}) async {
    try {
  Response response = await dio.get(
      '$BaseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    
    Weathermodel weathermodel=Weathermodel.fromjson(response.data);
    log(weathermodel.weatherCondition);
    return weathermodel;
} on DioException catch (e) {
  final String errorMessage=e.response?.data['error']['message']??'oops! there was an error';
  throw Exception(errorMessage);

} catch(e){
  log(e.toString());
  throw Exception('ooops there was an error');
}
}
}