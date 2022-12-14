import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String speciality;
  // final String image;
  final int reviews;
  final int reviewScore;

  Doctor(
      {required this.name,
      required this.speciality,
      // required this.image,
      required this.reviews,
      required this.reviewScore});
}
