import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/screen/Payment/metion_details.dart';

class UpdatedDetails extends StatefulWidget {
  const UpdatedDetails({super.key});

  @override
  State<UpdatedDetails> createState() => _UpdatedDetailsState();
}

class _UpdatedDetailsState extends State<UpdatedDetails> {
  var selecteGender;
  List<String> gender = ["Male", "Female"];

  var indiaStateList;
  List<String> indiaStates = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli and Daman and Diu",
    "Lakshadweep",
    "Delhi (National Capital Territory of Delhi)",
    "Puducherry",
    "Ladakh"
  ];

  var schoolNameController = TextEditingController();
  var placeController = TextEditingController();
  var fatherNameController = TextEditingController();
  var fatherPhoneNumberController = TextEditingController();
  var motherNameController = TextEditingController();
  var motherPhoneNumberController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

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
          "Update Details",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Fill the following Entries Correctly so that we will give best services",
                  style: TextStyle(color: Color(0xff7C86A2), fontSize: 14),
                ),
                ksizedbox5,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "School Name",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
                // SizedBox(
                //   height: height * 0.01,
                // ),
                TextFormField(
                  controller: schoolNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter School Name';
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
                ksizedbox10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Gender",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
                // SizedBox(
                //   height: height * 0.01,
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 47,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(.50))),
                  child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      isExpanded: true,
                      underline: Container(),
                      value: selecteGender,
                      //  hint: Text("Select ID or Name"),
                      items: gender.map((String type) {
                        return DropdownMenuItem(value: type, child: Text(type));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selecteGender = value!;
                        });
                      }),
                ),
                ksizedbox10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Place",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
            
                TextFormField(
                  controller: placeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Place';
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
                ksizedbox10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "State",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
                // SizedBox(
                //   height: height * 0.01,
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 47,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(.50))),
                  child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      isExpanded: true,
                      underline: Container(),
                      value: indiaStateList,
                      //  hint: Text("Select ID or Name"),
                      items: indiaStates.map((String type) {
                        return DropdownMenuItem(value: type, child: Text(type));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          indiaStateList = value!;
                        });
                      }),
                ),
                ksizedbox10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Father Name*",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
            
                TextFormField(
                  controller: fatherNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Father Name*';
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
                ksizedbox10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Father Phone Number*",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
            
                TextFormField(
                  controller: fatherPhoneNumberController,
                  inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Father Phone Number*';
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
                ksizedbox10,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mother Name*",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
            
                TextFormField(
                  controller: motherNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Mother Name*';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    contentPadding: const EdgeInsets.all(10),
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mother Phone Number*",
                      style: TextStyle(
                        color: Color(0xFF7C86A2),
                        fontSize: 15,
                      ),
                    )),
            
                TextFormField(
                  controller: motherPhoneNumberController,
                  inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Mother Phone Number*';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    contentPadding: const EdgeInsets.all(10),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {

          if(_formKey.currentState!.validate()){
            UpdateUserModel  updateUserModel = UpdateUserModel(
            fatherMobileNumber: fatherPhoneNumberController.text,
            fatherName: fatherNameController.text,
            gender: selecteGender,
            motherMobileNumber: motherPhoneNumberController.text,
            motherName: motherNameController.text,
            place: placeController.text,
            schoolName: schoolNameController.text,
            state: indiaStateList,
            studentName: "",
          );
            Get.to(MentionDetails(updateUserModel: updateUserModel,));
          }

         
       
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
          child: Container(
            height: height * 0.05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.blue),
            child: const Center(
              child: Text(
                "Update Now",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
