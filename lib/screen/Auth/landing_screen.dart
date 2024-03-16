import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/screen/Auth/select_class.dart';
import 'package:online_class_app/screen/Auth/sign_screen.dart';
import 'package:online_class_app/screen/Auth/signup_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                      Get.to(SelectClass());
                    },
                    child: Container(
                      height: 50,
                      width: 360,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("classes",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignupScreen());
                    },
                    child: Container(
                      height: 50,
                      width: 360,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue, width: 1)),
                      child: Text("Admission",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
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
