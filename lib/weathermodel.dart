import 'package:http/http.dart' as http ;
import 'dart:convert';
class worker
{

  String location;

  //Constructor

  worker(

  {

  required this.location,
  this.temp,
  this.humidity,
  this.air_speed,
  this.description,
  this.main,


}  )

  {
    location = this.location;
    temp = this.temp;
    humidity = this.humidity;
    air_speed = this.air_speed;
    description = this.description;
    main = this.main;
  }


  var temp;
  var humidity;
 var air_speed;
  var description;
  var main;

  //method =
 Future<void> getData() async
  {
    try {
      var response = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location &appid=e34a5eb0b4c5ff748fdf9219a63d224e"));
      Map data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        return;
      }

      Map tempData = data['main'];
      var getHumidity = tempData['humidity'];
      var getTemp = tempData['temp'];
//print(data);
//Getting air_speed
      Map wind = data['wind'];
      double getairSpeed = wind["speed"];


      //Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getmainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];


      //Assigning Values;

      temp = getTemp;
      humidity = getHumidity;
      air_speed = getairSpeed;
      description = getDesc;
      main = getmainDes;
    }catch(e)
    {
      print(e);
      temp = "Can't find data";
      humidity = "Can't find data";
      air_speed = "Can't find data";
      description= "Can't find data";
      main = "Can't find data";
    }


  }


}