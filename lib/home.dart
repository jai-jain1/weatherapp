import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is a init state");

  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
   Map<String , dynamic> info = ModalRoute.of(context)!.settings.arguments  as Map<String, dynamic> ;
    String t  =  ((info['temp_value']).toString().substring(0,4));
   var hum = info['humidity_value'];
   var air = ((info['airspeed_value']));
   String d = info['description_value'];
   // print(info);
   // print({info['temp_value']});
    return Scaffold(
      resizeToAvoidBottomInset: false,


     //body: SafeArea(
        body: Container(
            color: const Color(0xff1e0d2d),

          child: Column(
            children: [
            Container(
              //height: 55,
              padding: const EdgeInsets.symmetric(horizontal:8),
              margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white24,
              // color: Color(0xff1e0d2d),
            ),


              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print(searchController.text);
                      Navigator.pushNamed(context, "/loading",arguments: {
                        "searchText" : searchController.text,
                      });
                    },

             child:       Container(
                 child:  Icon(Icons.search),
               margin: EdgeInsets.fromLTRB(5, 3, 10, 5),

             ),

                  ),

                   Expanded(

                      child:TextField(
                        controller: searchController,
               decoration: InputDecoration(


                 hintText: "search $city",

               ),
                      )
                  )


                ],
              ),
            ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white24),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(26),
                child:Row(
                  children: [

                    Column(
                      children: [
                        Text("$d",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.black,
                        ),),

                        Text("In  $city",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                      ],

                    ),

                  ],
                ),

              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(

                height: 240,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white24
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(WeatherIcons.thermometer),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$t",style: TextStyle(
                            fontSize: 90
                        ),),
                        Text("C",style: TextStyle(
                            fontSize: 30
                        ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white24),
                margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                padding: const EdgeInsets.all(26),
                height: 200,
                child: Column(
                  children: [
                    Icon(WeatherIcons.day_cloudy_windy),

                  SizedBox(height: 30),
      Text("$air",style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold
      ),),
      Text("km/hr")
                  ],
                ),

              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white24
                ),
                margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                padding: const EdgeInsets.all(26),
                height: 200,
                child: Column(
                  children: [
                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(WeatherIcons.humidity)
                      ],
                    ),
                    SizedBox(height: 30,)
                    ,
                    Text("$hum",style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("Percent")
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(

          padding: const EdgeInsets.all(30),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Text("Made By Jai",
                style: TextStyle(color: Colors.white),
              ),
              Text("Data Provided By Openweathermap.org",
                style: TextStyle(color: Colors.white)
                ,)
            ],
          ),
        ),
      ],
          ),
        ),
     // ),
    );

  }
}


