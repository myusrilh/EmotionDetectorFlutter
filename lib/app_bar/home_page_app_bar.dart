import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: lightGreenColor,
      toolbarHeight: 87,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(45))),
      leading: Row(
        children: [
          const SizedBox(
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
          const Text(
            "Hi, Yusril",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
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
                  const SizedBox(
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
            const SizedBox(
              width: 46,
            )
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
