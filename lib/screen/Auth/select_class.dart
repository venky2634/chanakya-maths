import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/screen/Auth/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectClass extends StatefulWidget {
  SelectClass({super.key});

  @override
  State<SelectClass> createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  AuthController authController = Get.find<AuthController>();
  int isSelected = -1;

  int? selectedId;

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
  void initState() {
    super.initState();
    authController.getClassListUser();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      body: Obx(
        () => authController.isLoading.isTrue
            ? Center(
                child: Container(
                child: CircularProgressIndicator(),
              ))
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/Logo (2).png"),fit: BoxFit.fill)),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Text("Select Class you want to Learn",
                            style: primaryFonts.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return ListView.builder(
                            itemCount: authController.classesList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  selectedImage(index);
                                  setState(() {
                                    selectedId =
                                        authController.classesList[index].id;
                                  });
                                  if (authController
                                          .classesList[index].standard ==
                                      "JEE") {
                                    popUp();
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: 15, right: 15, left: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  height: 50.h,
                                  width: size.width * .9,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.blue, width: 1)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          authController
                                              .classesList[index].standard,
                                          style: primaryFonts.copyWith(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue)),
                                      Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                            color: isSelected == index
                                                ? Colors.blue
                                                : Colors.grey.withOpacity(.30),
                                            shape: BoxShape.circle),
                                        child: Image.asset(
                                          "Assets/Check.png",
                                          color: isSelected == index
                                              ? Colors.white
                                              : Colors.grey.withOpacity(.30),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }),
                      SizedBox(
                        height: size.height * 0.10,
                      ),
                      InkWell(
                        onTap: () async{
                            final prefs = await SharedPreferences.getInstance();
                             await prefs.setInt('std_id', selectedId!);
                          Get.to(SignupScreen(id: selectedId!));
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    const Align(
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
