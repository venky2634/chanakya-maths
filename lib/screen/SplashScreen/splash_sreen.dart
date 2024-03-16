import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:online_class_app/screen/BottomNavigation/Home/home_screen.dart';
import 'package:online_class_app/screen/onboarding/onboarding_screen.dart';
import 'package:online_class_app/screen/onboarding/onbodaing.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
      void initState() {  
    super.initState();  
    Timer(const Duration(seconds: 5),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) =>  OnbordingScreen()  
            )  
         )  
    );  
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