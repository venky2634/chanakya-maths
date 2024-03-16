import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_class_app/screen/BottomNavigation/bottom_navigation_screen.dart';
// import 'package:online_class_app/screen/BottomNavigation/Home/home_screen.dart';
import 'package:online_class_app/screen/onboarding/onboarding_screen.dart';
import 'package:online_class_app/screen/onboarding/onbodaing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
      void initState() {  
    super.initState();  
    toHomePage();
    // Timer(const Duration(seconds: 5),  
    //         ()=>Navigator.pushReplacement(context,  
    //         MaterialPageRoute(builder:  
    //             (context) =>  OnbordingScreen()  
    //         )  
    //      )  
    // );  
  } 



   toHomePage() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final prefs = await SharedPreferences.getInstance();
    String? authtoken = prefs.getString("auth_token");
    String? role = prefs.getString("role");
    print("Token is here");
    print(authtoken);
    if (authtoken == "null" || authtoken == null) {
      Get.offAll(
        () => OnbordingScreen(),
      );
    } else {
      Get.offAll(BottomNavigationScreen());
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/Group 676.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
        child: Image.asset('Assets/Logo.png'),
          ),
      ) ,
    );
    
    
   
  }
}