import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var selecteGender;
  List<String> gender = ["Male", "Female"];
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
            Icons.arrow_back,
            size: 25,
            color: const Color.fromARGB(255, 110, 83, 83),
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            TextFormField(
              //  controller: studentNamecontroller,

              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Name';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: primaryFonts.copyWith(color: Colors.black),
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
            ksizedbox30,
            TextFormField(
              //  controller: studentNamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Name';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Student Name",
                labelStyle: primaryFonts.copyWith(color: Colors.black),
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
            ksizedbox30,
            TextFormField(
              //  controller: studentNamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Name';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Date",
                labelStyle: primaryFonts.copyWith(color: Colors.black),
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
            ksizedbox30,
            TextFormField(
              //  controller: studentNamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Name';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "email",
                labelStyle: primaryFonts.copyWith(color: Colors.black),
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
            ksizedbox30,
            TextFormField(
              //  controller: studentNamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Name';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Country",
                labelStyle: primaryFonts.copyWith(color: Colors.black),
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
            ksizedbox30,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 47,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.withOpacity(0.10),
                  )),
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
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
          child: Container(
            height: height * 0.05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.blue),
            child: const Center(
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
