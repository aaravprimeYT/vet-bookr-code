// ignore_for_file: prefer_interpolation_to_compose_strings, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:doctor_app/data/data.dart';

import '../Data/data.dart';
import '../constant.dart';
import '../size_confige.dart';

// final Stream<QuerySnapshot> _usersStream =
//     FirebaseFirestore.instance.collection('petsDetails').snapshots();

class PetsList extends StatelessWidget {
  const PetsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 100,
      child: ListView.builder(
        itemCount: Data.categoriesList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        itemBuilder: (context, index) {
          final petdata = Data.categoriesList[index];
          final color = kCategoriesSecondryColor[
              (kCategoriesSecondryColor.length - index - 1)];
          final circleColor = kCategoriesPrimaryColor[
              (kCategoriesPrimaryColor.length - index - 1)];
          final cardWidth = w / 50;
          return Row(
            children: [
              Expanded(
                child: Container(
                  width: cardWidth,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                      color: color,
                                    ),
                                    height: h / 24,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: w / 12,
                                            height: h / 12,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 15,
                                                  color: circleColor
                                                      .withOpacity(0.6)),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: w / 12,
                                            height: h / 12,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 15,
                                                  color: circleColor
                                                      .withOpacity(0.25)),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: w / 12,
                                            height: h / 12,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 15,
                                                  color: circleColor
                                                      .withOpacity(0.17)),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //     width: cardWidth,
                              //     height: h / 20,
                              //     child: Image.asset(petdata.icon.toString())),
                            ],
                          ),
                          Text(
                            "My Pets",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Container(
                            height: h / 12,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h / 2, horizontal: w / 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name:" + petdata.title.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kHardTextColor,
                                        fontSize: 30),
                                  ),
                                  SizedBox(height: h / 5),
                                  Text(
                                    "Age:" + petdata.age.toString(),
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 30),
                                  ),
                                  SizedBox(height: h / 5),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: h / 4)
                                .copyWith(left: cardWidth * 0.7),
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                  color: Colors.black26,
                                )
                              ], color: Colors.white, shape: BoxShape.circle),
                              padding: EdgeInsets.all(w / 15),
                              child: Icon(
                                FontAwesomeIcons.facebookMessenger,
                                color: color,
                                size: w / 55,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: w / 4)
            ],
          );
        },
      ),
    );
  }
}
