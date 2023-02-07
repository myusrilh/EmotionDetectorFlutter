import 'package:emotion_detector/pages/profilepage.dart';
import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 47,
            ),
            Text(
              "Selamat Datang".toUpperCase(),
              style: TextStyle(
                  color: lightGreenColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 57,
            ),
            Image.asset('assets/images/Homepage_logo.png', width: 299),
            SizedBox(height: 50),
            Text(
              "Kami Siap Membantu Anda".toUpperCase(),
              style: TextStyle(
                  color: lightGreenColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 86,
            )
          ],
        ),
      )),
    );
  }
}
