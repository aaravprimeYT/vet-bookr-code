import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:vet_bookr/models/doctor.dart';
import 'package:vet_bookr/models/pets.dart';

class Data {
  static final categoriesList = [
    Category(
      title: "Fluffy",
      age: 15,
      icon: LineIcons.dog,
    ),
    Category(
      title: "Brownie",
      age: 8,
      icon: LineIcons.dog,
    ),
    Category(
      title: "Lucky",
      age: 7,
      icon: LineIcons.dog,
    ),
    Category(
      title: "Labrador",
      age: 10,
      icon: LineIcons.dog,
    ),
  ];

  static final doctorsList = [
    Doctor(
        name: "Dr.Hegazy Ali",
        speciality: "Cardiology",
        // image: "assets/images/doctor_1.png",
        reviews: 80,
        reviewScore: 4),
    Doctor(
        name: "Dr.Dani",
        speciality: "Dermatology",
        // image: "assets/images/doctor_2.png",
        reviews: 67,
        reviewScore: 5),
    Doctor(
        name: "Dr George",
        speciality: "Ophthalmology",
        // image: "assets/images/doctor_3.png",
        reviews: 19,
        reviewScore: 3),
  ];
}
