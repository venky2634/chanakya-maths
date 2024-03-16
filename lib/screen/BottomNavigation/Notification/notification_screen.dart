import 'package:flutter/material.dart';
import 'package:online_class_app/const/app_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          "Notification",
          style:
              primaryFonts.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("Assets/Object.png"),
          Text(
            "Nothing here",
            style: primaryFonts.copyWith(
                fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      )),
    );
  }
}
