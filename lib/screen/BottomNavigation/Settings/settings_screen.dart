import 'package:flutter/material.dart';
import 'package:online_class_app/const/app_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          title: Text(
            "Profile",
            style: primaryFonts.copyWith(
                fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Image.asset("Assets/Type=Edit Avatar, Component=Avatar.png"),
                ksizedbox10,
                Text(
                  "Andrew Ainsley",
                  style: primaryFonts.copyWith(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
                ksizedbox5,
               Text(
                  "12th Class Student",
                  style: primaryFonts.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        //  Image.asset(name)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}