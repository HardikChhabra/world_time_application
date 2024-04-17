import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? time; //the '?' makes the field nullable
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      //making a url to pass in the get function
      Uri address = Uri.parse("http://worldtimeapi.org/api/timezone/$url");

      //making the request
      Response response = await get(address);
      Map data = jsonDecode(response.body);

      //storing the data
      DateTime dateTime = DateTime.parse(data['datetime']);

      //adding or subtracting the time offset
      if(data['utc_offset'].substring(0,1) == '-'){
        dateTime.subtract(Duration(hours: int.parse(data['utc_offset'].substring(1, 3)), minutes: int.parse(data['utc_offset'].substring(4))));
      }
      else{
        dateTime = dateTime
            .add(Duration(hours: int.parse(data['utc_offset'].substring(1, 3)), minutes: int.parse(data['utc_offset'].substring(4))));
      }


      //set the time property
      time = DateFormat.jm().format(dateTime);
    }
    catch(e) {
      print(e);
      time = "Couldn't get time";
    }
  }
}
