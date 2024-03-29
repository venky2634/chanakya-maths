import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_class_app/const/app_fonts.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          "Classes",
          style:
              primaryFonts.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ongoing Class",
                  style: primaryFonts.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                ksizedbox10,
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: size.width,
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 1,
                            color: Colors.grey)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18)),
                            child: Container(
                                height: 150.h,
                                width: size.width,
                                child: Image.asset(
                                  "Assets/Rectangle 40.png",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: Container(
                              height: size.height * .04,
                              width: size.width * .20,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 5),
                                        height: 10,
                                        width: 10,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 9),
                                    child: Text(
                                      "Live",
                                      style: primaryFonts.copyWith(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        width: size.width * 0.81,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Maths",
                                        style: primaryFonts.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.account_circle_outlined),
                                    kwidth5,
                                    Text("1K+",
                                        style: primaryFonts.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                "These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to",
                                style: primaryFonts.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            // ksizedbox5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Students Added 1000+",
                                  style: primaryFonts.copyWith(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                Container(
                                  height: size.height * .035,
                                  width: size.width * .30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Join Now",
                                    style: primaryFonts.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ksizedbox10,
                Text(
                  "Upcoming Classes",
                  style: primaryFonts.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                ksizedbox10,
                Container(
                  decoration: BoxDecoration(
                  
                  ),
                  height: size.height * .40,
                  //  color: Colors.green[300],
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.all(10),
                          //   height: size.height * .17,
                          width: size.width,
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: Offset(0.0, 0.75),
                                    blurRadius: 5,
                                    color: Colors.grey.shade300)
                              ],
                              color: Colors.grey.withOpacity(.05),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  // margin: EdgeInsets.all(10),
                                  height: size.height * .12,
                                  width: size.width * .23,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    "Assets/Rectangle 45.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              kwidth10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Maths",
                                      style: primaryFonts.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                  Container(
                                    width: size.width * .6,
                                    height: size.height * .07,
                                    child: Text(
                                        "These Terms will be applied fully and affect \nto your use of this Website. By using this \nWebsite, you agreed to",
                                        textAlign: TextAlign.start,
                                        style: primaryFonts.copyWith(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff9C9C9C))),
                                  ),
                                  Container(
                                    height: 23,
                                    width: size.width * 0.6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Class Started Soon",
                                                style: primaryFonts.copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff787878))),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 23,
                                              width: size.width * .05,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffAFFFB2)),
                                              child: Text("09",
                                                  style: primaryFonts.copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                            ),
                                            kwidth5,
                                            Text(":",
                                                style: primaryFonts.copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                            kwidth5,
                                            Container(
                                              height: 23,
                                              width: size.width * .05,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffAFFFB2)),
                                              child: Text("30",
                                                  style: primaryFonts.copyWith(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
