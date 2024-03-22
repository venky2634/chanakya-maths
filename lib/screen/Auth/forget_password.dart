import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/screen/Auth/Widget/cutom_otp_card.dart';
import 'package:online_class_app/screen/Auth/Widget/forget_password_card.dart';
import 'package:online_class_app/screen/Auth/forget_password_otp.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  AuthController authController = Get.find<AuthController>();
  String field1 = '';

  TextEditingController mobilecontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //authController.forgetPasswordUser(mobile)
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Forget Password",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  Image.asset("Assets/12892978_5101872 1.png"),
                  ksizedbox15,
                  Text(
                    "First, let's find your account",
                    style: primaryFonts.copyWith(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Please enter your email or phone",
                    style: primaryFonts.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  ksizedbox30,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     //  CustomOtpCard(value: field1),
                  //     ForgetPasswordCard(value: field1)
                  //   ],
                  // ),
                  ksizedbox10,
                  TextFormField(
                    controller: mobilecontroller,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.length < 10 || value.length > 10) {
                        return 'Enter a your valid mobile Number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      hintStyle: primaryFonts.copyWith(
                          fontSize: 16,
                          color: Color(0xff7C86A2),
                          fontWeight: FontWeight.w700),
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(0.10),
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  ksizedbox20,
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        authController
                            .forgetPasswordUser(mobilecontroller.text);
                      }
                    },
                    child: Container(
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: const Center(
                        child: Text(
                          "Reset Password",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  ksizedbox20,
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Don’t have an account?',
                      style: primaryFonts.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    TextSpan(
                      text: 'Create Account',
                      style: primaryFonts.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                          fontSize: 15),
                    ),
                  ])),
                  // Row(
                  //   children: [
                  //     buildNumberButton('1'),
                  //     buildNumberButton('2'),
                  //     buildNumberButton('3')
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     buildNumberButton('4'),
                  //     buildNumberButton('5'),
                  //     buildNumberButton('6')
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     buildNumberButton('7'),
                  //     buildNumberButton('8'),
                  //     buildNumberButton('9')
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     buildNumberButton('*'),
                  //     buildNumberButton('0'),
                  //     buildClearButton()
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void resetFieldOnExit() {
  //   field1 = '';
  //   // field2 = '';
  //   // field3 = '';
  //   // field4 = '';
  //   setState(() {});
  // }

  // Widget buildNumberButton(String text) => Expanded(
  //       child: Container(
  //         color: Color(0xFFFAFAFA),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: IconButton(
  //               onPressed: () => setState(() {
  //                     if (field1.isEmpty) {
  //                       field1 = text;
  //                     }
  //                   }),
  //               icon: Text(
  //                 text,
  //                 style: TextStyle(fontSize: 28),
  //               )),
  //         ),
  //       ),
  //     );

  // Widget buildClearButton() => Expanded(
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: IconButton(
  //             onPressed: () => setState(
  //                   () {
  //                     if (field1.isNotEmpty) {
  //                       field1 = '';
  //                     }
  //                   },
  //                 ),
  //             icon: const Icon(
  //               Icons.backspace_outlined,
  //               size: 30,
  //               color: Colors.black,
  //             )),
  //       ),
  //     );
}
