import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ScanPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScanPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      title: Row(
        children: [
          Row(
            children: [
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
              ),
              SizedBox(
                width: 100,
              ),
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
            ],
          )
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 87,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(45))),
      leading: BackButton(
        // color: Colors.black,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
