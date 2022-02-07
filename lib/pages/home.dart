import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String flag = data['flag'];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/day.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/edit_location');
                setState(() {
                  data = {
                    'location': result['location'],
                    'flag': result['flag'],
                    'time': result['time'],
                  };
                });
              },
              icon: const Icon(Icons.location_on_outlined, size: 15.0),
              label: const Text('Edit Location'),
            ),
            const SizedBox(
              height: 28.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/$flag'),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Text(data['location']),
            const SizedBox(
              height: 14.0,
            ),
            Text(
              data['time'],
              style: const TextStyle(fontSize: 28.0, letterSpacing: 3.0),
            ),
          ],
        ),
      ),
    );
  }
}
