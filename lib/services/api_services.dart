import 'package:http/http.dart' as http;
import 'package:weather_app/consts/const.dart';
import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/model/hourly_weather_data.dart';

var link="https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";
var hourlylink="https://api.openweathermap.org/data/2.5/forecast?lat=21.5839&lon=92.0153&appid=73edd78f2baea96c47ae1b3d938989e8&units=metric";

getCurrentWeather()async{
  var res=await http.get(Uri.parse(link));
  if(res.statusCode==200){
    var data=currentWeatherDataFromJson(res.body.toString());
    return data;
  }
}
getHourlyWeather()async{
  var res=await http.get(Uri.parse(hourlylink));
  if(res.statusCode==200){
    var data=hourlyWeatherDataFromJson(res.body.toString());
    print("Hourly Data is recieved");
    return data;
  }
}