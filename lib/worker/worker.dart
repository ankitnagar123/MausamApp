//creating worker class and packages
import 'dart:convert';

import 'package:http/http.dart';

//creating data model
class worker {
  late String location;

  //Constructor
  worker({required this.location}) //named parameter
  {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

//creating method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location &appid=e34a5eb0b4c5ff748fdf9219a63d224e"));
      Map data = jsonDecode(response.body);
      print(data);

      //getting temp & humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //getting Air_Speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed'] / 0.27777777777778;

      //getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];



      //Assigning Values=>
      temp = getTemp.toString();
      air_speed = getAir_speed.toString();
      humidity = getHumidity;
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data['icon'].toString();
    } catch (e) {
      temp = 'data not found';
      air_speed = 'data not found';
      humidity = 'data not found';
      description = 'data not found';
      main = 'data not found';
      icon = '03n';
    }
  }
}
