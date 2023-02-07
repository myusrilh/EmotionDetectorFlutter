import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';

class ModifiedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ModifiedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
