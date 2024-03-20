import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';
import 'package:online_class_app/screen/BottomNavigation/bottom_navigation_screen.dart';



class PendingApprovalScreen extends StatefulWidget {
  const PendingApprovalScreen({super.key});

  @override
  State<PendingApprovalScreen> createState() => _PendingApprovalScreenState();
}

class _PendingApprovalScreenState extends State<PendingApprovalScreen> {


@override
void initState() {
  super.initState();
  // redirectToNextScreen();
}

   

    redirectToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(BottomNavigationScreen());
  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: (){
                    Get.find<AuthController>().logoutUser();       
            },
            child: const Icon(Icons.logout)),
        )],
      ),
      body: Container(
        height: size.height - 150,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Lottie.asset("Assets/pending_approval.json"),
        
        
            Text("Please Wait for admin Approval",style: primaryFonts.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}