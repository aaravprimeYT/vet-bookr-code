// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_confige.dart';

class DoctorBanner extends StatelessWidget {
  const DoctorBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: w / 94,
          height: h / 20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: w / 88,
                height: h / 20,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(40),
                //   // ignore: prefer_const_literals_to_create_immutables
                //   boxShadow: [
                //     BoxShadow(
                //       blurRadius: 40,
                //       offset: Offset(0, 15),
                //       color: kPrimaryDarkColor,
                //     )
                //   ],
                //   gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     // ignore: prefer_const_literals_to_create_immutables
                //     colors: [
                //       Color(0xff77E2FE),
                //       Color(0xff46BDFA),
                //     ],
                //   ),
                // ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: h / 3),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 1.0,
                              top: 2.0,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.black54,
                                size: h / 1,
                              ),
                            ),
                            Image.asset("assets/aboutscreen.png"),
                          ],
                        ),
                        SizedBox(width: w / 12),
                        // Flexible(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         "Check Up COVID-19",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: getRelativeWidth(0.055),
                        //         ),
                        //       ),
                        //       SizedBox(height: getRelativeHeight(0.02)),
                        //       Row(
                        //         children: [
                        //           Flexible(
                        //             child: Text(
                        //               "Contains several list of questions to check your physical condition.",
                        //               style: TextStyle(
                        //                   color: Colors.white.withOpacity(0.85),
                        //                   fontSize: getRelativeWidth(0.033)),
                        //             ),
                        //           ),
                        //           SizedBox(width: getRelativeWidth(0.03)),
                        //           Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white.withOpacity(0.2),
                        //                 borderRadius:
                        //                     BorderRadius.circular(15)),
                        //             padding:
                        //                 EdgeInsets.all(getRelativeWidth(0.012)),
                        //             child: Icon(
                        //               Icons.arrow_forward_ios,
                        //               color: Colors.white,
                        //               size: getRelativeWidth(0.038),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
