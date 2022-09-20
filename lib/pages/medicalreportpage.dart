import 'package:emotion_detector/pages/homepage.dart';
import 'package:emotion_detector/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalReportPage extends StatelessWidget {
  const MedicalReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List bulan = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];

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
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38, bottom: 14),
                  child: Text(
                    "Tahun: ",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
                Text(
                  "2022",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Container(
                      height: 105,
                      width: 320,
                      color: lightGreenColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 19, left: 18, bottom: 23, right: 20),
                            child: Container(
                              width: 75,
                              height: 75,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text(
                                    "Senin",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "12",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    bulan[index],
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 203,
                                color: orangeColor,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Hasil :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                    ),
                                    Text(
                                      "Sedih",
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                width: 203,
                                color: toscaColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Saran dari ahli :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                      Text(
                                          overflow: TextOverflow.ellipsis,
                                          "Kamu luapkan saja kesedihan kepada orang terdekat-mu, jangan kamu simpan sendiri karena aku adalah anak gembala",
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 10))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, position) {
                  return SizedBox(
                    height: 19,
                  );
                },
                itemCount: bulan.length,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
