import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {

  final String url;

  Network(this.url);

  Future getMapFromOpenWeather() async {
    final urlWeatherMap = Uri.parse(url);
    final response = await http.get(urlWeatherMap);
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      return decodedData;
    } else {
      print('there is an error : ${response.statusCode}');
    }
  }





}