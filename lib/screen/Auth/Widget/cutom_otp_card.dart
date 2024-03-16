import 'package:flutter/material.dart';

class CustomOtpCard extends StatelessWidget {
  final String value;
  CustomOtpCard({required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF8F8F8),
          ),
          duration: const Duration(milliseconds: 65),
          child: Text(
            value,
            style: TextStyle(fontSize: 30),
          )),
    );
  }
}
