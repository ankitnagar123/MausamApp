import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController =  TextEditingController();
  @override
  void initState() {
    super.initState();
    print('this is init state');
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print('this is set state');
  }

  @override
  void dispose() {
    super.dispose();
    print('Widget destroy');
  }

  @override
  Widget build(BuildContext context) {
    var cityName = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
     String temp = ((info['temp_value']).toString()).substring(0,4);
     String icon = info['icon_value'];
     String getcity = info['city_value'];
     String hum = info['hum_value'];
     String air = ((info['air_speed_value']).toString()).substring(0,4);
    String des = info['des_value'];
   // String icon = info['icon_value'];
  //  String getcity = info['city_value'];
   // String hum = info['hum_value'];
  //  String air = ((info['air_speed_value']).toString()).substring(0,4);
  //  String des = info['des_value'];

    return Scaffold(
      /* appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.orangeAccent.shade200,
        ),
      ),*/
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
            colors: [
              Colors.purpleAccent.shade100,
              Colors.orangeAccent.shade400,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.centerLeft,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                    stops: const [
                  0.2,
                  0.9,
                ],
                    colors: [
                  Colors.purpleAccent.shade200,
                  Colors.orangeAccent.shade200,
                ])),
            child: Column(
              children: <Widget>[
                Container(
                  // color: Colors.purple,
                  padding: const EdgeInsets.all(8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.purple[200],
                    borderRadius: BorderRadius.circular(35.12),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/loading",arguments: {
                              "searchText" : searchController.text,
                            });

                          },
                          
                          // margin: EdgeInsets.fromLTRB(2, 2, 2.2, 3),
                          child: Container(
                            margin: const EdgeInsets.only(left: 12),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 32,
                            ),
                          )),
                      const SizedBox(
                        width: 22,
                      ),
                      Expanded(
                          child: TextField(
                            controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search $city',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            letterSpacing: 2,
                            fontStyle: FontStyle.italic,
                          ),
                          focusColor: Colors.purple,
                          border: InputBorder.none,
                        ),
                      ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          margin:  EdgeInsets.symmetric(horizontal: 25.2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5),

                          ),
                          child: Row(children: [
                           Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 25,),
                            Column(
                              children: [
                                Text("$des",style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                ),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(" in $getcity",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            )
                          ])
                         ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 220,
                          padding: const EdgeInsets.all(28),
                          margin: const EdgeInsets.symmetric(horizontal: 32.2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.20),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.thermometer,
                                //  color: Colors.white70,
                                semanticLabel: 'temprature',
                                size: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$temp',
                                    style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'C',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(28),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy, size: 22),
                              ],
                            ),
                            SizedBox(
                              height: 5.5,
                            ),
                            Text(
                              '$air',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'km/hr',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(28),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            Text(
                              '$hum',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Percent',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Made By Ankit Dhakad",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            letterSpacing: 2,
                            fontSize: 15),
                      ),
                      Text(
                        "Data Provided By Openweathermap.org",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.1,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
