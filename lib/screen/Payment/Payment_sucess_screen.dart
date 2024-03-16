import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/screen/BottomNavigation/Home/home_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/Classes/classes_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/bottom_navigation_screen.dart';
// import 'package:online_class_app/screen/BottomNavigation/Home/home_screen.dart';

class PaymentSucessScreen extends StatefulWidget {
  const PaymentSucessScreen({super.key});

  @override
  State<PaymentSucessScreen> createState() => _PaymentSucessScreenState();
}

class _PaymentSucessScreenState extends State<PaymentSucessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Get.to(BottomNavigationScreen());
      //  timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationScreen()));
                },
                child: Image.asset("Assets/Payment_sucess_logo.png")),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Your payment has been\n successful",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
