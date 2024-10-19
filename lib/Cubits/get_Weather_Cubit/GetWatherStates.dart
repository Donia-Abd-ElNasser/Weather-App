

import 'package:weatherapp/Models/weatherModel.dart';

class WeatherState{}

class WeatherInitialState extends WeatherState {

}
class WeatherLoadedState extends WeatherState{
 final Weathermodel weathermodel;
  WeatherLoadedState(this.weathermodel);
}
class WeatherFailureState extends WeatherState{
  final String error;

  WeatherFailureState({required this.error});
}