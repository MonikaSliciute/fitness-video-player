import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          ],
        ),
      ),
    );
  }
}
