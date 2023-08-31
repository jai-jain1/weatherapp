import 'package:flutter/material.dart';
import 'package:weatherapp/home.dart';
import 'loading.dart';

//import 'package:weatherapp/chooseloc.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Loading(),
        "/home" : (context) =>  Home(),
      },
    )
  );
}
