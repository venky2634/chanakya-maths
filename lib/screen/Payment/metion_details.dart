import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/screen/Payment/payment_choose_screen.dart';

class MentionDetails extends StatefulWidget {
  const MentionDetails({super.key});

  @override
  State<MentionDetails> createState() => _MentionDetailsState();
}

class _MentionDetailsState extends State<MentionDetails> {
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
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name of Bank",
                  style: TextStyle(
                    color: Color(0xFF7C86A2),
                    fontSize: 15,
                  ),
                )),
            TextFormField(
              // controller: userNamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Name of Bank';
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
            ksizedbox20,
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account Holder Name",
                  style: TextStyle(
                    color: Color(0xFF7C86A2),
                    fontSize: 15,
                  ),
                )),
            TextFormField(
              // controller: userNamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Account Holder Name';
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
            ksizedbox20,
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account Related with Student",
                  style: TextStyle(
                    color: Color(0xFF7C86A2),
                    fontSize: 15,
                  ),
                )),
            TextFormField(
              // controller: userNamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a Account Related with Student';
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
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.to(PaymentChooseScreen());
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
