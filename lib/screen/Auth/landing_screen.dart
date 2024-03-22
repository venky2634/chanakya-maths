import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/screen/Auth/select_class.dart';
import 'package:online_class_app/screen/Auth/signin_screen.dart';
import 'package:online_class_app/screen/Auth/signup_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int isselected = 0;
  selectClass(index) {
    setState(() {
      isselected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("Assets/Group 9295.png"))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 135,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectClass(0);
                      Get.to(SignScreen());
                    },
                    child: Container(
                      height: 50,
                      width: 360,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isselected == 0 ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color:
                                  isselected == 0 ? Colors.white : Colors.blue,
                              width: 1)),
                      child: Text("Classes",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: isselected == 0
                                  ? Colors.white
                                  : Colors.blue)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SelectClass());
                      selectClass(1);
                    },
                    child: Container(
                      height: 50,
                      width: 360,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isselected == 1 ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color:
                                  isselected == 1 ? Colors.white : Colors.blue,
                              width: 1)),
                      child: Text("Admission",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: isselected == 1
                                  ? Colors.white
                                  : Colors.blue)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
