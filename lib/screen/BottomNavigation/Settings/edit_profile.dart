import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/profile_controller.dart';
import 'package:online_class_app/model/profile_model/updateprofile_model.dart';
import 'package:online_class_app/model/update_user_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState(); 
}

class _EditProfileState extends State<EditProfile> {
  var selecteGender;
  var gender = ["Male", "Female"];
  final profileController = Get.find<ProfileController>();
  var studentNamecontroller = TextEditingController();
  var nameController = TextEditingController();
  var gmailController = TextEditingController();
var mobilenumber = TextEditingController();
var genderController = TextEditingController();

@override
void initState() {
  super.initState();
  profileController.getprofile();
  getprofiledata();
}
getprofiledata()async{
  if(profileController.getUserData!=null){
    studentNamecontroller.text = profileController.getUserData!.studentName;
    nameController.text = profileController.getUserData!.username;
    gmailController.text = profileController.getUserData!.email;
    mobilenumber.text = profileController.getUserData!.mobile;
    genderController.text = profileController.getUserData!.gender;

  }
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
        child: GetBuilder<ProfileController>(
          builder: (_) {
            return Column(
              children: [
                TextFormField(
                    controller:nameController,
            
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
                    controller: studentNamecontroller,
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
                  controller: gmailController,
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
                    controller: mobilenumber,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter mobile number';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
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
                // ksizedbox30,
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   height: 47,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //       color: Colors.grey.withOpacity(0.10),
                //       borderRadius: BorderRadius.circular(5),
                //       border: Border.all(
                //         width: 0.5,
                //         color: Colors.grey.withOpacity(0.10),
                //       )),
                //   child: DropdownButton<String>(
                //       borderRadius: BorderRadius.circular(10),
                //       isExpanded: true,
                //       underline: Container(),
                //       value: profileController.getUserData!.gender,
                //         hint: Text('Gender'),
                //       items: gender.map<DropdownMenuItem<String>>((String type) {
                //         return DropdownMenuItem<String>(value: type, child: Text(type));
                //       }).toList(),
                //       onChanged: (String? value) {
                //         setState(() {
                //           profileController.getUserData!.gender = value!;
                //         });
                //       }),
                // ),
              ],
            );
          }
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
         Updateprofile updateprofileModel = 
         Updateprofile(
           gender: gender.toString(), 
           studentName: studentNamecontroller.text,
            email: gmailController.text, 
            mobile: mobilenumber.text, 
            name: nameController.text,);
          profileController.updateprofile(updateprofileModel: updateprofileModel);
           profileController.update();
           Get.back();
        },
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
