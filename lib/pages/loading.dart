import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String loadingLabel = 'World Time';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Bangladesh', url: 'Asia/Dhaka', flag: 'bd.png');
    await instance.getTime();
    if (instance.time == "Oops") {
      setState(() {
        loadingLabel = 'We are trying connecting...';
      });
    } else {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
          Container(
            margin: const EdgeInsets.only(top: 32.0),
            child: Text(
              loadingLabel,
              style: const TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
