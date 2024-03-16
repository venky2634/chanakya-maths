// import 'package:flutter/material.dart';
// import 'package:onboarding/onboarding.dart';

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   late Widget materialButton;
//   late int index;
//   final onboardingPagesList = [
//     PageModel(
//       widget: SingleChildScrollView(
//         controller: ScrollController(),
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: Image.asset('Assets/onbording/Group 661.png',
//                   alignment: Alignment.center),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'Headings',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const Padding(
//               padding: const EdgeInsets.all(15),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions.",
//                   style: TextStyle(color: Colors.black),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     PageModel(
//       widget: DecoratedBox(
//         decoration: BoxDecoration(
//           color: background,
//           border: Border.all(
//             width: 0.0,
//             color: background,
//           ),
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                   vertical: 90.0,
//                 ),
//                 child: Image.asset('Assets/onbording/Group 661.png',
//                     color: pageImageColor),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'CHANGE AND RISE',
//                     style: pageTitleStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Give others access to any file or folders you choose',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     PageModel(
//       widget: DecoratedBox(
//         decoration: BoxDecoration(
//           color: background,
//           border: Border.all(
//             width: 0.0,
//             color: background,
//           ),
//         ),
//         child: SingleChildScrollView(
//           controller: ScrollController(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 45.0,
//                   vertical: 90.0,
//                 ),
//                 child: Image.asset('Assets/onbording/Group 661.png',
//                     color: pageImageColor),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'EASY ACCESS',
//                     style: pageTitleStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Reach your files anytime from any devices anywhere',
//                     style: pageInfoStyle,
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     materialButton = backButton();
//     index = 0;
//   }

//   Widget backButton ({void Function(int)? setIndex}) {
//     return InkWell(
//       onTap: () {
//         if (index > 0) {
//           setIndex!(index - 1);
//         }
//       },
//       child: Container(
//         height: 50,
//         width: 50,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(500),
//             color: Colors.black,
//             border: Border.all(color: Colors.black)),
//         child: const Center(
//           child: Icon(
//             Icons.arrow_forward,
//             color: Colors.white,
//             size: 15,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget forwradButton({void Function(int)? setIndex}) {
//     return InkWell(
//       onTap: () {
//         if (index < onboardingPagesList.length - 1) {
//           setIndex!(index + 1);
//         }
//       },
//       child: Container(
//         height: 50,
//         width: 50,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadiusDirectional.circular(50),
//              border: Border.all(color: Colors.black)
//             ),
//         child: const Center(
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Onboarding(
//           pages: onboardingPagesList,
//           onPageChange: (int pageIndex) {
//             index = pageIndex;
//           },
//           startPageIndex: 0,
//           footerBuilder: (context, dragDistance, pagesLength, setIndex) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 30, left: 30),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       index == 0
//                           ? Container()
//                           : backButton(setIndex: setIndex),
//                       CustomIndicator(
//                         netDragPercent: dragDistance,
//                         pagesLength: pagesLength,
//                         indicator: Indicator(
//                           indicatorDesign: IndicatorDesign.polygon(
//                             polygonDesign: PolygonDesign(
//                               polygon: DesignType.polygon_circle,
//                             ),
//                           ),
//                         ),
//                       ),
//                      if (index != pagesLength - 1)
//                         forwradButton(setIndex: setIndex),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// class PageModel {
//   final Widget widget;

//   PageModel({required this.widget});
// }
