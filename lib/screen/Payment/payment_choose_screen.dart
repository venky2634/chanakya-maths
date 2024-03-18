import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/model/term_fee_model.dart';
import 'package:online_class_app/screen/Payment/Payment_sucess_screen.dart';

class PaymentChooseScreen extends StatefulWidget {
  const PaymentChooseScreen({super.key});

  @override
  State<PaymentChooseScreen> createState() => _PaymentChooseScreenState();
}

class _PaymentChooseScreenState extends State<PaymentChooseScreen> {
  final AuthController authController = Get.find<AuthController>();
  int selectedIndex = -1;
  bool value = false;
  bool isChecked = false;
  bool isClicked = false;
  int? selectedId;
  String? price;
  int? planId;
  // List<bool> checkboxValues = List.generate(3, (_) => false);
  List<TermFeeModel> fees = [
    TermFeeModel(
        term: "First Term Fee",
        discount: "Save 50%",
        days: "7 days",
        amount: "₹9,000/-"),
    TermFeeModel(
        term: "Secound Term Fee",
        discount: "Save 50%",
        days: "7 days",
        amount: "₹9,000/-"),
    TermFeeModel(
        term: "Third Term Fee",
        discount: "Save 50%",
        days: "7 days",
        amount: "18,000/-")
  ];

  @override
  void initState() {
    super.initState();
    authController.getPlanUser();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF111236),
        //   leading: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(
        //       Icons.arrow_back_ios_new,
        //       size: 15,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF171F5D), Color(0xFF111236)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Your Plan",
                    style: TextStyle(
                        color: Colors.white,
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
                    "10th Class",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: 430,
                child: GetBuilder<AuthController>(
                  builder: (_) {
                    return ListView.builder(
                        itemCount: authController.termfeeList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                //  checkboxValues[index] = !checkboxValues[index];
                                planId = authController.termfeeList[index].id;
                                    price = authController.termfeeList[index].price;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                height: height * 0.12,
                                width: width * 0.70,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFFF8F8F8).withOpacity(0.2),
                                        Color(0xFF929292).withOpacity(0.2)
                                      ],
                                    ),
                                    border: index == selectedIndex
                                        ? Border.all(color: const Color(0xFFFFCE8A))
                                        : Border.all(color: Color(0xFF6A6DA6)),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            authController.termfeeList[index].title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.01,
                                              ),
                                              Text(
                                                authController
                                                    .termfeeList[index].description,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.01,
                                              ),
                                              Text(
                                                authController
                                                    .termfeeList[index].validTill,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          selectedIndex == index
                                              ? Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 20),
                                                  child: Checkbox(
                                                    shape: const CircleBorder(),
                                                    checkColor: Colors.white,
                                                    activeColor: Color(0xFFFFCE8A),
                                                    value: true,
                                                    onChanged: (bool? value) {
                                                      // setState(() {
                                                      //    checkboxValues[index] = value!;
                                                      // });
                                                    },
                                                  ),
                                                )
                                              : Checkbox(
                                                  shape: const CircleBorder(),
                                                  checkColor: Colors.white,
                                                  activeColor: Color(0xFFFFCE8A),
                                                  value: false,
                                                  onChanged: (bool? value) {
                                                    // setState(() {
                                                    //    checkboxValues[index] = value!;
                                                    // });
                                                  },
                                                ),
                                          Text(
                                            authController.termfeeList[index].price,
                                            style: TextStyle(
                                              color: Color(0xFFFFCE8A),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
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
                      text: TextSpan(children: [
                    TextSpan(
                      text:
                          "These Terms will be applied fully and affect to your \nuse of this Website. By using this Website, you \nagreed to accept all terms and conditions written in \nhere. You must not use this Website if you disagree \nwith any of these Website Standard ",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          popUp();
                        },
                      text: "\nTerms and Conditions.",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    )
                  ])),
                ],
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
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              authController.addPlanUser(price!, planId!);
            },
            child: Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: const Center(
                child: Text(
                  "Continue to Purchase",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
