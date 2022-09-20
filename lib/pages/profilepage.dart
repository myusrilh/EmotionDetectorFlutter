import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Homepage'),
        // centerTitle: true,
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
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 90),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 17,
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    child: Image.asset(
                      'assets/images/profile_picture.png',
                      width: 144,
                    )),
                SizedBox(
                  height: 21,
                ),
                Text("Muhammad Yusril Hasriansyah",
                    style: TextStyle(
                      color: lightGreenColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
                Text("20 Tahun",
                    style: TextStyle(
                      color: lightGreenColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  height: 129,
                  width: 314,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text("Tentang pengguna",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14, right: 7),
                        child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Seorang mahasiswa random yang suka melakukan segala hal yang menantang. Sering overthinking dan tidak percaya diri. Namun, itu semua tidak membuat semangat untuk berkarya menghilang.", maxLines: 4,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: lightGreenColor,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 3.0, color: toscaColor)
                      //more than 50% of width makes circle
                      ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 154.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Tingkat stress",
                          style: TextStyle(
                            color: lightGreenColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          )),
                      LinearPercentIndicator(
                        // width: 154.0,
                        lineHeight: 23.0,
                        animation: true,
                        percent: 0.5,
                        progressColor: lightGreenColor,
                        backgroundColor: Colors.white,
                        barRadius: const Radius.circular(25),
                      ),
                      Text("50%",
                          style: TextStyle(
                            color: lightGreenColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
