import 'dart:async';

import 'package:emotion_detector/pages/homepage.dart';
import 'package:emotion_detector/pages/masterpage.dart';
import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MasterPage()),
            ));

    return Scaffold(
      backgroundColor: lightGreenColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 123,
              ),
              Text(
                'Emotion Detector',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 49,
              ),
              Image.asset(
                'assets/images/Logo.png',
                width: 170,
              ),
              SizedBox(
                height: 34,
              ),
              Text('For Therapy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 168,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
