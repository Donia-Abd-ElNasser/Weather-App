


class Weathermodel {
  final String image;
  final double maxTemp;
   final double minTemp;
   final double avgTemp ;
  final String cityName;
  final String weatherCondition;
  final DateTime date;
  Weathermodel(
      {required this.weatherCondition,
      required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.cityName,
      required this.date,
      required this.avgTemp});
  factory Weathermodel.fromjson(dynamic json) {
    var jsonData= json['forecast']['forecastday'][0]['day'];
    return Weathermodel(
        weatherCondition: jsonData['condition']['text'],
        image:jsonData['condition']['icon'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        avgTemp: jsonData['avgtemp_c']);
  }
}
