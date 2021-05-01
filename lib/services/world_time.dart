import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String location; // location name for the UI
  String url; // url for the location
  String flag; // image for flag
  String time; // time in that location
  int timeofDay; // true if daytime, else false

  WorldTime({ this.location,this.flag,this.url });

  Future<void> getTime() async
  {
    try
    {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data=jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'];
      String offset1 = offset.substring(1,3);
      String offset2 = offset.substring(4,6);
      // print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now =now.add(Duration(hours: int.parse(offset1),minutes: int.parse(offset2)));
      if(now.hour >= 4 && now.hour <= 6)
        timeofDay = 1; // dawn
      else if(now.hour >= 7 && now.hour <= 11)
        timeofDay = 2; // morning
      else if(now.hour >= 12 && now.hour <= 3)
        timeofDay = 3; // noon
      else if(now.hour >= 4 && now.hour <= 6)
        timeofDay = 4; // dusk
      else
        timeofDay = 5; // night
      time = DateFormat.jm().format(now);
    }
    catch(e)
    {
      // print('Caught error: $e');
      time='could not load time!';
    }

  }
}