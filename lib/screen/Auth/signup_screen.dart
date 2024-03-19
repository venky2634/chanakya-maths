import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/controller/auth_api_controller/profile_controller.dart';
import 'package:online_class_app/model/signup_model.dart';
import 'package:online_class_app/screen/Auth/signin_screen.dart';

class SignupScreen extends StatefulWidget {
  int id;
  SignupScreen({super.key, required this.id});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  AuthController authController = Get.find<AuthController>();
  final controller =Get.find<ProfileController>();
  bool value = false;
  bool passwordVisible = false;
  bool isChecked = false;
  bool isClicked = false;

  var selectClassOption;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getprivacypolicy();
  }

  TextEditingController studentNamecontroller = TextEditingController();
 TextEditingController userNamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();
  List<String> getProjectName(BuildContext context) {
    return [
      '9th standard',
      '10th standard',
      '11th standard',
      '12th standard',
      'JEE',
    ];
  }

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
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: const Color.fromARGB(255, 110, 83, 83),
            ),
          ),
          title: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hi!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Create a new account",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Student Name",
                              style: TextStyle(
                                color: Color(0xFF7C86A2),
                                fontSize: 16,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFormField(
                          controller: studentNamecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a Student Name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
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
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Username",
                              style: TextStyle(
                                color: Color(0xFF7C86A2),
                                fontSize: 16,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: authController.userNamecontroller,
                                onChanged: (value) {
                                  // Call the method to check user availability here
                                  authController.Useravilability(
                                      username: value);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter your Name';
                                  } else if (!authController.isavilabe.isTrue) {
                                    return 'Username is not available';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffix: authController.isavilabe.isTrue
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
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
                              ksizedbox10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  authController.isavilabe.isTrue
                                      ? Text(
                                          'Availabe',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green),
                                        )
                                      : Text(
                                          'Not Availabe',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red),
                                        )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email Address",
                              style: TextStyle(
                                color: Color(0xFF7C86A2),
                                fontSize: 16,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a your Email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
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
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                color: Color(0xFF7C86A2),
                                fontSize: 16,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFormField(
                          controller: mobilecontroller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your number';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
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
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: Color(0xFF7C86A2), fontSize: 16),
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: TextFormField(
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10),
                            fillColor: Colors.grey.withOpacity(0.10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: height * 0.04,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 20, left: 20),
                      //   child: DropdownButtonFormField(
                      //     decoration: InputDecoration(
                      //       hintText: "Select Class",
                      //       hintStyle: TextStyle(
                      //         fontSize: 16,
                      //         color: Color(0xFF7C86A2),
                      //       ),
                      //       contentPadding:
                      //           const EdgeInsets.fromLTRB(10, 10, 15, 18),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(
                      //             color: Color.fromARGB(255, 243, 243, 243),
                      //             width: 1),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //           borderSide: BorderSide.none),
                      //       filled: true,
                      //       fillColor: Colors.grey.withOpacity(0.10),
                      //     ),
                      //     dropdownColor: Colors.white,
                      //     value: selectClassOption,
                      //     borderRadius: BorderRadius.circular(10),
                      //     alignment: Alignment.center,
                      //     isExpanded: true,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         selectClassOption = value;
                      //       });
                      //     },
                      //     items: getProjectName(context)
                      //         .map<DropdownMenuItem<String>>(
                      //       (projectnameslist) {
                      //         return DropdownMenuItem<String>(
                      //           value: projectnameslist,
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(left: 15),
                      //             child: Text(
                      //               projectnameslist,
                      //               style: const TextStyle(
                      //                 fontSize: 15,
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ).toList(),
                      //   ),
                      // ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: value,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.value = value!;
                                  isChecked = this.value;
                                });
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'I agree your',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 13),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        popUp();
                                      },
                                    text: ' Terms & Condition',
                                    style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.blue,
                                        fontSize: 13),
                                  ),
                                  const TextSpan(
                                    text: ' and',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 13),
                                  ),
                                   TextSpan(   recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            height: 600,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Privacy & Policy',
                            style: primaryFonts.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.clear,
                                size: 20,
                              ))
                        ],
                      ), Container(height: 500,
                        child: ListView.builder(
                          itemCount: controller.getprivayData.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ksizedbox15,
                                Row(
                                  children: [
                                    Text(
                                      controller.getprivayData[index].title, // Assuming getprivayData is a List<String>
                                      style: primaryFonts.copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                ksizedbox10,
                                Text(
                               controller.getprivayData[index].description, 
                                  style: primaryFonts.copyWith(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                   
                    ],
                  ),
                ),
              ),
            ),
          );
        });
                                      },
                                    text: ' Privacy Policy',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.blue,
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isClicked == true)
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Please agree the terms and conditions",
                              style: primaryFonts.copyWith(
                                  color: Colors.red, fontSize: 15),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          if (isChecked != false) {
                            setState(() {
                              isClicked = false;
                            });
                            if (value == true) {
                              if (formKey.currentState!.validate()) {
                                SignUp signUp = SignUp(
                                    name: studentNamecontroller.text,
                                    userName: authController.userNamecontroller.text,
                                    email: emailcontroller.text,
                                    mobile: mobilecontroller.text,
                                    password: passwordcontroller.text);
                                authController.singUpUser(signUp);
                              }
                            }
                          } else {
                            setState(() {
                              isClicked = true;
                            });
                          }
                        },
                        child: Obx(
                          () => Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: authController.isLoading.isTrue
                                  ? Container(
                                      child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20),
                                      child: Container(
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.blue),
                                        child: const Center(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    )),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 1,
                            color: Color(0xFFE1E1E1),
                          )),
                          const Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Or Sign up with",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: 1,
                            color: Color(0xFFE1E1E1),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.25),
                                  width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("Assets/Group 645.png"),
                                const Text(
                                  "   Sign In With Google",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignScreen()));
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'You already have an account?',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                              TextSpan(
                                text: ' Sign In',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.blue,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                )
              ])),
            )
          ],
        ));
  }

  popUp() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            height: 600,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Terms and Conditions',
                            style: primaryFonts.copyWith(
                                fontSize: 18, color: Colors.black),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.clear,
                                size: 20,
                              ))
                        ],
                      ),
                      ksizedbox15,
                      Text(
                        'Dear Parents,',
                        style: primaryFonts.copyWith(
                            fontSize: 16, color: Colors.black),
                      ),
                      ksizedbox10,
                      Text(
                        'Welcome to the “Chanakya” group. Whatever class be you ward going to join, we will teach maths perfectly in dedicate manner consider as my child. By your side if you ward is responsible then no issue otherwise please do something to check they are attending in class or doing something while classes are going there. By keeping mic ‘on’ mode, if they are produce sound that will disturb our class. Such kind of disturbance strictly we never allow.',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox15,
                      Text(
                        'Your child must be;',
                        style: primaryFonts.copyWith(
                            fontSize: 16, color: Colors.black),
                      ),
                      ksizedbox10,
                      Text(
                        '1. Attentive in the class',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '2.Daily HomeWork will be given in class they must try by themselves.',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '3.Doubts will be cleared in next day itself.',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '5.By an avoiding circumstance of the student not able to attend the class you must inform us (In the office no: 9531813846) and before attending next class he/she must watch the left class (or) classes. Otherwise they will face problem to understand the further classes.',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '6.Every class must be recorded, the student will allow to watch once.',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '7.Those who are absent only allow to see the recorded video. ',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '8.If the student are  not attentive. After somedays if he/she wants to the recorded video that time the student will allow to see the video by paying Rs. 100 per video.',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '9.So students must sincere in listening and taking notes and doing HomeWork daily and asking doubts. ',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        '10.For any doubt and clarifications parents can call me in ',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        'Punitha - 9434272193  (only between 11:00am to 1:00pm on weekends only)',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                      ksizedbox5,
                      Text(
                        'Thanks to Choose Chanakya.',
                        style: primaryFonts.copyWith(
                            fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
