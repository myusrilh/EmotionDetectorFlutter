import 'package:emotion_detector/app_bar/home_page_app_bar.dart';
import 'package:emotion_detector/app_bar/scan_page_app_bar.dart';
import 'package:emotion_detector/app_bar/without_tingkat_stress_app_bar.dart';
import 'package:emotion_detector/pages/homepage.dart';
import 'package:emotion_detector/pages/medicalreportpage.dart';
import 'package:emotion_detector/pages/profilepage.dart';
import 'package:emotion_detector/pages/scanpage.dart';
import 'package:flutter/material.dart';
import 'package:emotion_detector/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

final _pageOptions = [MedicalReportPage(), HomePage(), ProfilePage()];

class _MasterPageState extends State<MasterPage> {
  int selectedPage = 1;
  var scanSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: selectedPage == 3 ? true : false,
        appBar: _appBarWidget(),
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
              backgroundColor: lightGreenColor,
              onPressed: () {
                // setState(() {
                //   selectedPage = 3;
                // });
                scanSelected = true;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scan()),
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Scan.png'),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          //add ClipRRect widget for Round Corner
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(45),
                topLeft: Radius.circular(45),
              ),
              child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  //add background color
                  backgroundColor: lightGreenColor,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/images/Medical_report.svg',
                          width: 21.5,
                          height: 26.5,
                          color:
                              selectedPage == 0 ? Colors.white : darkGreenColor,
                        ),
                        label: 'Medical report'),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/images/Home_icon.svg',
                          width: 34,
                          height: 27,
                          color:
                              selectedPage == 1 ? Colors.white : darkGreenColor,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/Profile_icon.svg',
                        width: 34,
                        height: 27,
                        color:
                            selectedPage == 2 ? Colors.white : darkGreenColor,
                      ),
                      label: 'Profile',
                    ),
                  ],
                  elevation: 5.0,
                  currentIndex: selectedPage,
                  onTap: (index) {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => _pageOptions[index]),
                    //     (route) => false);
                    setState(() {
                      scanSelected = false;
                      selectedPage = index;
                    });
                  })),
        ));
  }

  PreferredSizeWidget _appBarWidget() {
    if (selectedPage == 1) {
      return HomePageAppBar();
    } else if (scanSelected) {
      return ScanPageAppBar();
    } else {
      return ModifiedAppBar();
    }
  }
}
