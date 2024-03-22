import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/controller/auth_api_controller/profile_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController authController = Get.find<AuthController>();
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.getprofile();
      authController.getClassListUser();
    });
  }

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ProfileController>(builder: (_) {
          return Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      child: Image.asset(
                        "Assets/Group 9302.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 60,
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
                              children: [
                                controller.isLoading.isTrue
                                    ? Text('Loading...',
                                        style: primaryFonts.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white))
                                    : Text(controller.getUserData!.studentName,
                                        style: primaryFonts.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                Text(controller.getUserData!.standard,
                                    style: primaryFonts.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        )),
                    Positioned(
                      top: 140,
                      left: 20,
                      child: Text("Discover the best Maths \nOnline Course",
                          style: primaryFonts.copyWith(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    Positioned(
                      top: 250.h, left: 0, right: 0,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 35, left: 35),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 20,
                          ),
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Color(0XFFF5F5F5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  kwidth10,
                                  Container(
                                    padding: EdgeInsets.only(top: 12),
                                    height: 50,
                                    width: 210,
                                    child: TextFormField(
                                      //  controller: studentNamecontroller,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter a Name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Search",
                                        hintStyle: primaryFonts.copyWith(
                                            color: Colors.grey),
                                        border: InputBorder.none,
                                        // fillColor: Colors.grey.withOpacity(0.10),
                                        // filled: true,
                                        //contentPadding: EdgeInsets.all(10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("Assets/Search.png"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 47,
                      //   width: size.width,
                      //   decoration: BoxDecoration(color: Colors.white),
                      // child: TextFormField(
                      // controller: passwordcontroller,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Enter your password';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      //   decoration: InputDecoration(
                      //     border: InputBorder.none,
                      //     contentPadding: const EdgeInsets.all(10),
                      //     fillColor: Colors.white,
                      //     filled: true,
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(10.0),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(10.0),
                      //     ),
                      //     suffixIcon: IconButton(
                      //         icon: Icon(Icons.search), onPressed: () {}),
                      //   ),
                      // ),
                      // ),
                    ),
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
                  height: 265.h,
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          width: size.width * .81,
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
                                        height: 140.h,
                                        width: size.width * .81,
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
                                      width: size.width * .17,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(15)),
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
                                                padding:
                                                    EdgeInsets.only(left: 5),
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
                                            padding:
                                                const EdgeInsets.only(right: 9),
                                            child: Text(
                                              "Live",
                                              style: primaryFonts.copyWith(
                                                  fontSize: 13,
                                                  color: Colors.white),
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
                height: size.height * .12,
                //  width: size.width * .88,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset("Assets/Rectangle 35.png"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(
                            children: [
                              Positioned(
                                top: 20,
                                left: 40,
                                child: Text(
                                  "Classes will be",
                                  style: primaryFonts.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 40,
                                child: Text("Start 20th April",
                                    style: primaryFonts.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            //  top: 5,
                            left: 240,
                            child: Container(
                                child:
                                    Image.asset("Assets/online-class 1.png"))),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .02,
              )
            ],
          );
        }),
      ),
    );
  }
}
