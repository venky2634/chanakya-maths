import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/screen/Auth/landing_screen.dart';
import 'package:online_class_app/screen/BottomNavigation/Settings/edit_profile.dart';
import 'package:online_class_app/screen/BottomNavigation/Settings/help_centre.dart';
import 'package:online_class_app/screen/BottomNavigation/Settings/payment.dart';
import 'package:online_class_app/screen/BottomNavigation/Settings/privacy_policy.dart';
import 'package:online_class_app/screen/SplashScreen/splash_sreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                InkWell(
                    onTap: () async {
                      // final SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // await prefs.setString('auth_token', "null");
                      // Get.offAll(() => SpalshScreen());
                    },
                    child: Image.asset(
                        "Assets/Type=Edit Avatar, Component=Avatar.png")),
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
                ksizedbox30,
                InkWell(
                  onTap: () {
                    Get.to(EditProfile());
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("Assets/Profile.png"),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Text(
                              "Edit Profile",
                              style: primaryFonts.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff212121)),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(EditProfile());
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ksizedbox15,
                InkWell(
                  onTap: () {
                    // Get.to(PaymentOption());
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("Assets/Wallet.png"),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Text(
                              "Payment",
                              style: primaryFonts.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff212121)),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: const Color.fromARGB(255, 110, 83, 83),
                        ),
                      ],
                    ),
                  ),
                ),
                ksizedbox15,
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("Assets/Wallet.png"),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Text(
                              "Time Table",
                              style: primaryFonts.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff212121)),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: const Color.fromARGB(255, 110, 83, 83),
                        ),
                      ],
                    ),
                  ),
                ),
                ksizedbox15,
                InkWell(
                  onTap: () {
                    Get.to(PrivacyPolicy());
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("Assets/Lock.png"),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Text(
                              "Privacy Policy",
                              style: primaryFonts.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff212121)),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(PrivacyPolicy());
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: const Color.fromARGB(255, 110, 83, 83),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ksizedbox15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("Assets/Info Square.png"),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        Text(
                          "Help Centre",
                          style: primaryFonts.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff212121)),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(HelpCentre());
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: const Color.fromARGB(255, 110, 83, 83),
                      ),
                    ),
                  ],
                ),
                ksizedbox15,
                InkWell(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('auth_token', "null");
                    Get.offAll(() => SpalshScreen());
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("Assets/Logout.png"),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Text(
                              "LogOut",
                              style: primaryFonts.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff212121)),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('auth_token', "null");
                            Get.offAll(() => SpalshScreen());
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: const Color.fromARGB(255, 110, 83, 83),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
