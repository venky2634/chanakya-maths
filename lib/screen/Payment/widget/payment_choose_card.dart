import 'package:flutter/material.dart';

class PaymentChooseCard extends StatefulWidget {
  const PaymentChooseCard({super.key});

  @override
  State<PaymentChooseCard> createState() => _PaymentChooseCardState();
}

class _PaymentChooseCardState extends State<PaymentChooseCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool value = false;
    String text = "7 Days";
    return Container(
      height: height * 0.10,
      width: width * 0.80,
      decoration: BoxDecoration(
          gradient:  LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFF8F8F8).withOpacity(0.2), Color(0xFF929292).withOpacity(0.2)],
                        ),

          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("First Term",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Text("Save 50%"),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 2,
                    width: 2,
                    color: Colors.grey,
                  ),
                  Text("Get${text} free"),
                ],
              )
            ],
          ),
          Column(
            children: [
              Checkbox(
                shape: CircleBorder(),
                checkColor: Colors.white,
                activeColor: Colors.blue,
                value: value,
                onChanged: (bool? value) {
                  setState(() {
                     value = value!;
                  });
                },
              ),
              Text(
                "₹25,000/-",
                // style: TextStyle(
                //   color: Color(0xFFFFCE8A),
                // ),
              )
            ],
          )
        ],
      ),
    );
  }
}
