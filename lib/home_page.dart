import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart' as color;

class ExerciseItem {
  String title;
  String path;
  ExerciseItem(this.title, this.path);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) {
      info = json.decode(value);
      return info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            // Row 1
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()), // spacer between text and icons
                Icon(
                  // icon 1
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(width: 10), // spacer between icons 1 and 2
                Icon(
                  // icon 2
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(width: 15), // spacer between icons 2 and 3
                Icon(
                  // icons 3
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            SizedBox(height: 30), // spacer between rows 1 and 2
            // Row 2
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: color.AppColor.homePageSubtitle,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                SizedBox(width: 5), // spacer between text and icon
                Icon(Icons.arrow_forward,
                    size: 20, color: color.AppColor.homePageIcons),
              ],
            ),
            SizedBox(height: 20), // spacer between rows 2 and 3
            // Row 3 - purple container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5,
                          10), // 5px from left to right, 10px from top to bottom
                      blurRadius: 10, // lightness of the shadow
                      color: color.AppColor.gradientSecond.withOpacity(0.2))
                ],
              ),
              child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 25,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // align left
                    children: [
                      Text("Next workout",
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  color.AppColor.homePageContainerTextSmall)),
                      SizedBox(
                        height: 5,
                      ), // spacer between texts
                      Text("Legs Toning",
                          style: TextStyle(
                              fontSize: 25,
                              color:
                                  color.AppColor.homePageContainerTextSmall)),
                      SizedBox(
                        height: 5,
                      ), // spacer between texts
                      Text("and Glutes Workout",
                          style: TextStyle(
                              fontSize: 25,
                              color:
                                  color.AppColor.homePageContainerTextSmall)),
                      SizedBox(
                        height: 25,
                      ),
                      // bottom row of purple container
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // bottom left corner row
                          Row(
                            children: [
                              Icon(Icons.timer,
                                  size: 20,
                                  color: color
                                      .AppColor.homePageContainerTextSmall),
                              SizedBox(
                                  width: 10), // spacer between icon and text
                              Text(
                                "60 min",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: color
                                        .AppColor.homePageContainerTextSmall),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8)),
                              ],
                            ),
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 5),
            // Row 4
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              //padding: EdgeInsets.all(5),
              child: Stack(
                // allows overlapping
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/card.jpg"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(8, 10),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, -5),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      right: 200,
                      bottom: 30,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/figure.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(
                      left: 150,
                      top: 50,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 40),
                          child: RichText(
                            text: TextSpan(
                              text: "Keep it up\n",
                              style: TextStyle(
                                color: color.AppColor.homePagePlanColor,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: "stick to your plan",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Row 5
            Row(
              children: [
                Text(
                  "Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            // Collection:
            Expanded(
              child: ListView.builder(
                itemCount: info.length, // size of info
                itemBuilder: (_, i) {
                  return Row(
                    children: [
                      Container(
                        height: 170,
                        width: 200,
                        padding: EdgeInsets.only(
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(info[i]['img']),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.1),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.1),
                              ),
                            ]),
                        child: Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              info[i]['title'],
                              style: TextStyle(
                                fontSize: 20,
                                color: color.AppColor.homePageDetail,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
