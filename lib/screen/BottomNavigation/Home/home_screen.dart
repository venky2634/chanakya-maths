import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/profile_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
void initState() {
  super.initState();
 getdata() ;
}





getdata() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       controller.getprofile();
    
    });
  }

final controller=Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ProfileController>(
        builder: (_) {
          return Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.asset("Assets/Group 9302.png"),
                    Positioned(
                        top: 90,
                        left: 20,
                        child: Row(
                          children: [
                            Image.asset(
                              "Assets/Ellipse 16.png",
                              height: 50,
                              width: 50,
                            ),
                            kwidth10,
                            kwidth10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [controller.isLoading.isTrue?Text('Loading...', style: primaryFonts.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)):
                                Text(controller.getUserData!.studentName,
                                    style: primaryFonts.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                Text("10th Class",
                                    style: primaryFonts.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        )),
                    Positioned(
                      top: 170,
                      left: 20,
                      child: Text("Discover the best Maths \nOnline Course",
                          style: primaryFonts.copyWith(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    Positioned(
                      top: 250,
                      left: 20,
                      child: Container(
                        height: size.height * .06,
                        width: size.width * .85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Find a next session",
                                  style: primaryFonts.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              IconButton(onPressed: () {}, icon: Icon(Icons.search))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ksizedbox10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today Stream",
                        style: primaryFonts.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Text("See All",
                        style: primaryFonts.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue)),
                  ],
                ),
              ),
              ksizedbox10,
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Container(
                  height: size.height * .30,
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          height: size.height * .30,
                          width: size.width * .81,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(18)),
                          child: Stack(
                            children: [
                              Image.asset("Assets/Rectangle 40.png"),
                              Positioned(
                                left: 10,
                                top: 10,
                                child: Container(
                                  height: size.height * .03,
                                  width: size.width * .17,
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
                              Positioned(
                                top: 135,
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  height: size.height * .16,
                                  width: size.width * .81,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(17),
                                          bottomRight: Radius.circular(17))),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                      color: Colors.blue)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                height: size.height * .11,
                width: size.width * .88,
                child: Stack(
                  children: [
                    Image.asset("Assets/Rectangle 35.png"),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        "Classes will be",
                        style: primaryFonts.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Text("Start 20th April",
                          style: primaryFonts.copyWith(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    Positioned(
                        //  top: 5,
                        left: 230,
                        child: Image.asset("Assets/online-class 1.png")),
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
