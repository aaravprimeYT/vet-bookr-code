// ignore_for_file: unnecessary_const

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vet_bookr/screens/dynamic_user_validation.dart';

class LoadingPage extends StatefulWidget {
  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const DynamicUserValidation())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffFFD9B3),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              const Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: const Text("Welcome!",
                    style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              const Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: const Text(
                      "Vet Bookr is the all-in-one app for pet parents to find a vet, pet-friendly places and pharmacies nearby, with the unique convenience of storing your pet's health records in one place for the future reference.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          height: 1.4,
                          fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
