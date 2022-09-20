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
      appBar: AppBar(
        backgroundColor: lightGreenColor,
        toolbarHeight: 87,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(45))),
        leading: Row(
          children: [
            SizedBox(
              width: 37,
              height: 0,
            ),
            IconButton(
                onPressed: () {},
                icon: Container(
                  child: Image.asset(
                    'assets/images/up_profile_icon_round.png',
                    width: 28,
                  ),
                )),
            Text(
              "Hi, Yusril",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: [
          Row(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tingkat stress",
                      style: TextStyle(
                          color: toscaColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    LinearPercentIndicator(
                      width: 113.0,
                      lineHeight: 14.0,
                      animation: true,
                      percent: 0.5,
                      // center: Text("50%"),
                      progressColor: toscaColor,
                      backgroundColor: Colors.white,
                      barRadius: const Radius.circular(25),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 46,
              )
            ],
          )
        ],
      ),
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
