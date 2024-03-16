import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/screen/Auth/sign_screen.dart';
import 'package:online_class_app/screen/Auth/signup_screen.dart';

class SelectClass extends StatefulWidget {
  const SelectClass({super.key});

  @override
  State<SelectClass> createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  int isSelected = 0;

  selectedImage(int index) {
    setState(() {
      isSelected = index;
    });
  }

  var selecteBatch;
  List<String> batch = ["2024", "2025"];

  var selecteClass;
  List<String> classes = [
    "9th Standard",
    "10th Standard",
    "11th Standard",
    "12th Standard"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("Assets/Logo (2).png"))),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 140,
              ),
              Text("Select Class you want to Learn",
                  style: primaryFonts.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              GestureDetector(
                onTap: () {
                  selectedImage(0);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  width: size.width * .9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("9th Standard",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: isSelected == 0
                                ? Colors.blue
                                : Colors.grey.withOpacity(.30),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "Assets/Check.png",
                          color: isSelected == 0
                              ? Colors.white
                              : Colors.grey.withOpacity(.30),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ksizedbox30,
              GestureDetector(
                onTap: () {
                  selectedImage(1);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  width: size.width * .9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("10th Standard",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: isSelected == 1
                                ? Colors.blue
                                : Colors.grey.withOpacity(.30),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "Assets/Check.png",
                          color: isSelected == 1
                              ? Colors.white
                              : Colors.grey.withOpacity(.30),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ksizedbox30,
              GestureDetector(
                onTap: () {
                  selectedImage(2);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  width: size.width * .9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("11th Standard",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: isSelected == 2
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(.30),
                              shape: BoxShape.circle),
                          child: Image.asset(
                            "Assets/Check.png",
                            color: isSelected == 2
                                ? Colors.white
                                : Colors.grey.withOpacity(.30),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ksizedbox30,
              GestureDetector(
                onTap: () {
                  selectedImage(3);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  width: size.width * .9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("12th Standard",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: isSelected == 3
                                ? Colors.blue
                                : Colors.grey.withOpacity(.30),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "Assets/Check.png",
                          color: isSelected == 3
                              ? Colors.white
                              : Colors.grey.withOpacity(.30),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ksizedbox30,
              GestureDetector(
                onTap: () {
                  selectedImage(4);
                  popUp();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  width: size.width * .9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("JEE Class",
                          style: primaryFonts.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: isSelected == 4
                                ? Colors.blue
                                : Colors.grey.withOpacity(.30),
                            shape: BoxShape.circle),
                        child: Image.asset(
                          "Assets/Check.png",
                          color: isSelected == 4
                              ? Colors.white
                              : Colors.grey.withOpacity(.30),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.11,
              ),
              InkWell(
                onTap: () {
                  Get.to(SignScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  popUp() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "User Code*",
                          style: TextStyle(
                              color: Color(0xFF7C86A2),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                    TextFormField(
                      // controller: userNamecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a your Name';
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

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Batch*",
                          style: TextStyle(
                            color: Color(0xFF7C86A2),
                            fontSize: 15,
                          ),
                        )),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      // margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 47,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 0.5,
                              color: Colors.black.withOpacity(.50))),
                      child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          underline: Container(),
                          value: selecteBatch,
                          //  hint: Text("Select ID or Name"),
                          items: batch.map((String type) {
                            return DropdownMenuItem(
                                value: type, child: Text(type));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selecteBatch = value!;
                            });
                          }),
                    ),
                    //  ksizedbox10,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Class*",
                          style: TextStyle(
                            color: Color(0xFF7C86A2),
                            fontSize: 15,
                          ),
                        )),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      // margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 47,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 0.5,
                              color: Colors.black.withOpacity(.50))),
                      child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          underline: Container(),
                          value: selecteClass,
                          //  hint: Text("Select ID or Name"),
                          items: classes.map((String type) {
                            return DropdownMenuItem(
                                value: type, child: Text(type));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selecteClass = value!;
                            });
                          }),
                    ),
                    ksizedbox10,
                    InkWell(
                      onTap: () {
                        // Get.to(MentionDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 5),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: const Center(
                            child: Text(
                              "Update Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
