import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  late String time;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // data properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // datetime
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // time update
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Oops';
    }
  }
}
