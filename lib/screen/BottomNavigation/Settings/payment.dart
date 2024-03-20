import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/controller/auth_api_controller/auth_api_controller.dart';

class PaymentOption extends StatefulWidget {
  String planId;
  PaymentOption({super.key, required this.planId});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  AuthController authController = Get.find<AuthController>();
  ImagePicker picker = ImagePicker();

  XFile? image;

  List paymentImage = [];
  selectImage(image) {
    if (image != null) {
      paymentImage.add(File(image!.path));
    }
  }

  @override
  void initState() {
    super.initState();
    authController.paymentOptionUser("00", widget.planId);
  }

  var transactionIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          "Payment Options",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: SingleChildScrollView(
          child: Center(
            child: GetBuilder<AuthController>(builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Scan QR code",
                    style: primaryFonts.copyWith(fontSize: 18),
                  ),
                  ksizedbox5,
                  authController.qrCodeData == null
                      ? Container()
                      : Container(
                          height: 160,
                          width: 190,
                          child: Image.memory(base64Decode(authController
                              .qrCodeData!.qrImage
                              .split(",")
                              .last)),
                        ),
                  ksizedbox15,
                  // Container(
                  //   height: 50,
                  //   width: 190,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       color: Colors.blue,
                  //       borderRadius: BorderRadius.circular(25)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Download",
                  //         style: primaryFonts.copyWith(
                  //             fontSize: 18, color: Colors.white),
                  //       ),
                  //       kwidth10,
                  //       Container(
                  //           height: 30,
                  //           width: 30,
                  //           decoration: const BoxDecoration(
                  //               color: Colors.white, shape: BoxShape.circle),
                  //           child: const Icon(Icons.download))
                  //     ],
                  //   ),
                  // ),
                  ksizedbox15,
                  authController.qrCodeData == null
                      ? Text("")
                      : Text(
                          "Amount: ₹${authController.qrCodeData!.paymentData.amount}",
                          style: primaryFonts.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                  ksizedbox15,
                  Text(
                    "After making the payment please upload the screenshot in below",
                    textAlign: TextAlign.center,
                    style: primaryFonts.copyWith(
                        fontSize: 13, color: Colors.black45),
                  ),
                  ksizedbox15,
                  TextFormField(
                    controller: transactionIdController,
                    decoration: InputDecoration(
                        hintText: "Enter Transaction ID",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18))),
                  ),
                  ksizedbox15,
                  Container(
                    height: 140,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.30),
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      onTap: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          image == null
                              ? Image.asset(
                                  "Assets/Group (1).png",
                                  height: 80,
                                  width: 80,
                                  color: Colors.grey,
                                )
                              : Image.file(
                                  height: 110,
                                  File(image!.path),
                                  fit: BoxFit.fitHeight,
                                ),
                          Text(
                            "Upload your screen shot here...",
                            textAlign: TextAlign.center,
                            style: primaryFonts.copyWith(
                                fontSize: 13, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ksizedbox20,
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => authController.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : InkWell(
                onTap: () {
                  if (image != null ||
                      transactionIdController.text.isNotEmpty) {
                    authController.submitPaymentDetails(
                        planId: int.parse(
                            authController.qrCodeData!.paymentData.planId),
                        price: authController.qrCodeData!.paymentData.amount,
                        txnId: transactionIdController.text,
                        paymentId: authController.qrCodeData!.paymentData.id
                            .toString(),
                        paymentImage: image!.path);
                  } else {
                    Get.rawSnackbar(
                        backgroundColor: Colors.red,
                        messageText: const Text(
                          "Enter Transaction Id & Upload Screenshot before submiting",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ));
                  }
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  height: 50,
                  width: size.width,
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
    );
  }
}
