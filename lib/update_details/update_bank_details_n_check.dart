import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/model/update_bank_details_model.dart';
import 'package:online_class_app/model/update_user_model.dart';
import 'package:online_class_app/screen/Payment/payment_choose_screen.dart';

class UpdateBanlDetailsOnLater extends StatefulWidget {
   UpdateBanlDetailsOnLater({super.key});

  @override
  State<UpdateBanlDetailsOnLater> createState() => _MentionDetailsState();
}

class _MentionDetailsState extends State<UpdateBanlDetailsOnLater> {



  var authController = Get.find<AuthController>();

 var _formKey = GlobalKey<FormState>();
var nameOfAccountController = TextEditingController();
var accountHolderName = TextEditingController();
var accountRelatedController = TextEditingController();


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
                controller: nameOfAccountController,
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
                controller: accountHolderName,
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
                controller: accountRelatedController,
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
      ),
      bottomNavigationBar: Obx(()=> authController.isLoading.isTrue ?  Center(child: CircularProgressIndicator()) : InkWell(
          onTap: () {
        
            if(_formKey.currentState!.validate()){
              UpdateBankDetailsModel updateBankDetailsModel = UpdateBankDetailsModel(
              accHolderName: nameOfAccountController.text,
              accRelatedTo: accountHolderName.text,
              bankName: accountRelatedController.text
            );
              authController.updateBankDetailsOnLater(updateBankDetailsModel);
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
      ),
    );
  }
}
