import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCircle;
import 'package:mausam/worker/worker.dart';
import 'dart:core';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //creating start app method
  late String city = 'Indore';
  late String temp;
  late String hum;
  late String air_speed;
  late String desc;
  late String main;
  late String icon;

//sending Data from one route (LOADING....)
  void startApp( String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    desc = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/homescreen', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": desc,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context)?.settings.arguments as Map ;

    if(search.isNotEmpty == false)
    {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/background_loading.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/Weather-icon.png',
                height: 200.2,
                width: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Mausam App',
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 38,
                    letterSpacing: 2.9,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              SpinKitFadingCircle(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.amber : Colors.blue,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // backgroundColor: Colors.yellow[200],
    );
  }
}
