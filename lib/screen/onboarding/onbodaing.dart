import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_class_app/comman/class.dart';
import 'package:online_class_app/screen/Auth/landing_screen.dart';
import 'package:online_class_app/screen/Auth/signin_screen.dart';
// import 'package:online_class_app/screen/BottomNavigation/Home/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentIndex = 0;
  late PageController _controller;
  bool _isTimerActive = true;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
    // startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void startTimer() {
  //   Timer.periodic(Duration(seconds: 3), (Timer timer) {
  //     if (_isTimerActive) {
  //       if (currentIndex < 2) {
  //         currentIndex++;
  //       } else {
  //         currentIndex = 0;
  //       }
  //       // Animate to the next page
  //       _controller.animateToPage(
  //         currentIndex,
  //         duration: Duration(milliseconds: 100),
  //         curve: Curves.easeIn,
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFD8FDFF),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFD8FDFF), Color(0xFFD8CBFF)],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  reverse: false,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: size.height * 0.55,
                          width: size.width,

                          // fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            // style: primaryFont.copyWith(
                            // fontSize: 26,fontWeight: FontWeight.w600,color: AppColors.black,)
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(contents[i].discription,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)
                              // fontSize: 18,fontWeight: FontWeight.w300,color: AppColors.grey,)
                              ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentIndex == 0
                        ? Container(
                            height: 50,
                            width: 50,
                          )
                        : InkWell(
                            onTap: () {
                              if (currentIndex == 0) {
                                // Navigate back if current index is 0
                                Navigator.pop(context);
                              } else {
                                // Move to the previous page if not on the first page
                                _controller.previousPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn,
                                );
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(500),
                                  border: Border.all(color: Colors.black)),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: SlideEffect(
                        activeDotColor: Colors.black,
                        dotHeight: 10,
                        dotColor: Colors.grey.withOpacity(0.3),
                        dotWidth: 10,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //Get.off(HistoryScreen());
                        // Get.off(const LandingScreen());
                        if (currentIndex == contents.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              //builder: (_) => BottomBar(),
                              builder: (_) => LandingScreen(),
                            ),
                          );
                        }
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: Colors.black,
                            border: Border.all(color: Colors.black)),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 30,

              // )
            ],
          ),
        ),
      ),
    );
  }

  // Container buildDot(int index, BuildContext context) {
  //   return Container(
  //     height: 10,
  //     width: currentIndex == index ? 25 : 10,
  //     margin: const EdgeInsets.only(right: 5),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       color: Colors.black,
  //     ),
  //   );
  // }
}
