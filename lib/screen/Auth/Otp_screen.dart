import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/screen/Auth/Widget/cutom_otp_card.dart';
import 'package:online_class_app/screen/Payment/payment_choose_screen.dart';
import 'package:online_class_app/update_details/update_details.dart';

class OtpValidation extends StatefulWidget {
 String? mobile;
  OtpValidation({super.key, required this.mobile});

  @override
  State<OtpValidation> createState() => _OtpValidationState();
}

class _OtpValidationState extends State<OtpValidation> {

  AuthController authController = Get.find<AuthController>();
  String field1 = '';
  String field2 = '';
  String field3 = '';
  String field4 = '';

  late Timer timer;
  int start = 60;
  bool isLoading = false;
  bool hasError = false;
  String currentText = "";
  // late StreamController<ErrorAnimationType> errorController;
  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer _timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          isLoading = false;
        });
      } else {
        setState(() {
          start = start - 1;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // errorController = StreamController<ErrorAnimationType>();
    startTimer();
  }

  @override
  void dispose() {
    //  errorController.close();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Verification",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height:20.h,
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone Verification",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Code is send to ${widget.mobile}",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomOtpCard(value: field1),
              CustomOtpCard(value: field2),
              CustomOtpCard(value: field3),
              CustomOtpCard(value: field4),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          start != 0 ? Padding(
                  padding:  EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Text(
                        "Resend Code in",
                        style: primaryFonts.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        start.toString(),
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Didn't receive SMS?",
                          style: primaryFonts.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            start = 10;
                            isLoading = true;
                            startTimer();
                          });
                          authController.resendOtpUser(widget.mobile!);
                        },
                        child: Text(" Resend code",
                            style: primaryFonts.copyWith(
                                //    decoration: TextDecoration.underline,
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
          // InkWell(
          //   onTap: () {
          //     // Navigator.push(
          //     //     context,
          //     //     MaterialPageRoute(
          //     //         builder: (context) => const ()));
          //   },
          //   child: RichText(
          //     text: const TextSpan(
          //       children: [
          //         TextSpan(
          //           text: "Don't receive code?",
          //           style: TextStyle(
          //               decoration: TextDecoration.none,
          //               color: Colors.black,
          //               fontSize: 14),
          //         ),
          //         TextSpan(
          //           text: ' Request again',
          //           style: TextStyle(
          //               decoration: TextDecoration.none,
          //               color: Colors.blue,
          //               fontSize: 14),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const Spacer(),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: InkWell(
            onTap: () {
              String otpValue = "$field1$field2$field3$field4";

              if (otpValue.length == 4) {
                authController.signUpOtpUser(widget.mobile!, otpValue);
              } else {
                //    errorController.add(ErrorAnimationType.shake);
                setState(() {
                  hasError = true;
                  //  scaffoldKey.currentState!;
                });
              }
            },
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: authController.isLoading.isTrue
                    ? Container(child: CircularProgressIndicator())
                    : Container(
                        height: height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                        child: const Center(
                          child: Text(
                            "Verify",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
            ),
          )))),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              buildNumberButton('1'),
              buildNumberButton('2'),
              buildNumberButton('3')
            ],
          ),
          Row(
            children: [
              buildNumberButton('4'),
              buildNumberButton('5'),
              buildNumberButton('6')
            ],
          ),
          Row(
            children: [
              buildNumberButton('7'),
              buildNumberButton('8'),
              buildNumberButton('9')
            ],
          ),
          Row(
            children: [
              buildNumberButton('*'),
              buildNumberButton('0'),
              buildClearButton()
            ],
          ),
        ],
      ),
    );
  }

  void resetFieldOnExit() {
    field1 = '';
    field2 = '';
    field3 = '';
    field4 = '';
    setState(() {});
  }

  Widget buildNumberButton(String text) => Expanded(
        child: Container(
          color: Color(0xFFFAFAFA),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => setState(() {
                      if (field1.isEmpty) {
                        field1 = text;
                      } else if (field2.isEmpty) {
                        field2 = text;
                      } else if (field3.isEmpty) {
                        field3 = text;
                      } else if (field4.isEmpty) {
                        field4 = text;
                      }
                    }),
                icon: Text(
                  text,
                  style: TextStyle(fontSize: 28.sp),
                )),
          ),
        ),
      );

  Widget buildClearButton() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () => setState(
                    () {
                      if (field4.isNotEmpty) {
                        field4 = '';
                      } else if (field3.isNotEmpty) {
                        field3 = '';
                      } else if (field2.isNotEmpty) {
                        field2 = '';
                      } else if (field1.isNotEmpty) {
                        field1 = '';
                      }
                    },
                  ),
              icon:  Icon(
                Icons.backspace_outlined,
                size: 30.sp,
                color: Colors.black,
              )),
        ),
      );
}
