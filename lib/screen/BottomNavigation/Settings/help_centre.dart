import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_class_app/const/app_fonts.dart';
import 'package:online_class_app/model/Faq_model.dart';

class HelpCentre extends StatefulWidget {
  const HelpCentre({super.key});

  @override
  State<HelpCentre> createState() => _HelpCentreState();
}

class _HelpCentreState extends State<HelpCentre> {
  List helpCentre = ["General", "Account", "Services", "Payment"];
  int selectedType = 0;

  selectType(index) {
    setState(() {
      selectedType = index;
    });
  }

  List<FaqModel> faqList = [
    FaqModel(
        headingTitle: "What is Potea?",
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
    FaqModel(headingTitle: "How to buy plant?", content: "Dummy data"),
    FaqModel(headingTitle: "How do I cancel an orders?", content: "Dummy data"),
    FaqModel(headingTitle: "Is Potea free to use?", content: "Dummy data"),
    FaqModel(
        headingTitle: "How to add promo when checkout?", content: "Dummy data"),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.yellowAccent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: AppBar(
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
            title: Text(
              "Help Center",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset("Assets/Group.png"),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: 'FAQ'),
                Tab(text: 'Contact us'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  ksizedbox10,
                  Container(
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: helpCentre.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              selectType(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 30,
                              width: 110,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: selectedType == index
                                      ? Color(0xff2572ED)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 1, color: Color(0xff2572ED))),
                              child: Text(
                                helpCentre[index],
                                style: secondaryFonts.copyWith(
                                    color: selectedType == index
                                        ? Colors.white
                                        : Color(0xff2572ED)),
                              ),
                            ),
                          );
                        }),
                  ),
                  ksizedbox15,
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 15,
                    ),
                    height: 56,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0XFFF5F5F5),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("Assets/Search.png"),
                            kwidth10,
                            Container(
                              padding: EdgeInsets.only(top: 12),
                              height: 46,
                              width: 300,
                              child: TextFormField(
                                //  controller: studentNamecontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Name';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle:
                                      primaryFonts.copyWith(color: Colors.grey),
                                  border: InputBorder.none,
                                  // fillColor: Colors.grey.withOpacity(0.10),
                                  // filled: true,
                                  //contentPadding: EdgeInsets.all(10),
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
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("Assets/filter.png"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: faqList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ExpansionTileGroup(children: [
                            ExpansionTileWithoutBorderItem(
                              trailing:
                                  Image.asset("Assets/Arrow - Down 2.png"),
                              title: Text(faqList[index].headingTitle!,
                                  style: secondaryFonts.copyWith(
                                    color: Colors.black.withOpacity(.90),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  )),
                              expendedBorderColor: Colors.blue,
                              children: [
                                Text(faqList[index].content!,
                                    style: secondaryFonts.copyWith(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          ]),
                          Divider(
                            color: Colors.white,
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text('Contact us'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
