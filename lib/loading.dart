

import 'package:flutter/material.dart';
import 'package:weatherapp/weathermodel.dart' show worker;
import 'package:flutter_spinkit/flutter_spinkit.dart';







class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
var Temp;
var hum;
var airSPeed;
var descr;
var mainn;
 var city ;



  void startApp(var  city ) async
  {


    worker instance  = worker(location:city);
     await instance.getData();


       //print(instance.temp);
       Temp =instance.temp-273.15;
       hum = instance.humidity;
       airSPeed = instance.air_speed;
       descr = instance.description;
       mainn = instance.main;
       Future.delayed(Duration(seconds: 1),() {
         Navigator.pushReplacementNamed(context, '/home',arguments:{
           "temp_value" : Temp,
           "humidity_value" : hum,
           "airspeed_value" : airSPeed,
           "description_value" : descr,
           "main_value" : mainn,
           "city_value" : city,
         });

       });



  }

@override
  void initState() {



    super.initState();

  }
  @override

  Widget build(BuildContext context) {
  // Object? search = ModalRoute.of(context)?.settings.arguments;


   // Map? search = ModalRoute.of(context)!.settings.arguments  as Map ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/loading.jpg"),
        fit: BoxFit.cover,
        )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Weather App", style: TextStyle(
              fontSize:  38,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),),

            SizedBox(
              height: 15,
            ),
            SpinKitWave(
          color: Colors.white70,
          size: 50.0,
        ),
            SizedBox(
              height: 15,
            ),
            Text("MADE BY JAI",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.white70,
            ),
            )

          ],
        ),
      ),
      ),
    ),
    );
  }
}
