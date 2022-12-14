import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vet_bookr/oScreens/addPet_screen.dart';
import 'package:vet_bookr/oScreens/loadingscreen1.dart';
import 'package:vet_bookr/oScreens/petClinics_page.dart';
import 'package:vet_bookr/oScreens/pharma_Loading.dart';
import 'package:vet_bookr/oScreens/clinicsloading.dart';
import 'package:vet_bookr/oScreens/social_loading.dart';
import 'package:vet_bookr/screens/pharmacyList.dart';
import 'package:vet_bookr/oScreens/SocialFilter.dart';

import 'loadingscreen2.dart';
import 'loadingscreen3.dart';
import 'loadingscreen4.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/menu_background.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                "assets/logo.png",
                height: 110,
                width: 200,
              ),
            ),
            Row(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50.0, top: 50.0, bottom: 10, left: 50.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPetHome()));
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(CircleBorder())),
                      child: Image.asset("assets/My_Pet_Profile.png",
                          width: 100, height: 100),
                    ),
                  ),
                  const Text(
                    "My Pet Profile",
                    style: TextStyle(fontSize: 18, fontFamily: "Vintage Style"),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, top: 50.0, bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashScreen()));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffFAEEE2)),
                          shape: MaterialStateProperty.all(CircleBorder())),
                      child: Image.asset("assets/Find_a_Pet.png",
                          width: 100, height: 100),
                    ),
                  ),
                  const Text(
                    "Find a Vet",
                    style: TextStyle(fontSize: 18, fontFamily: "Vintage Style"),
                  ),
                ],
              ),
            ]),
            Row(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50.0, top: 50.0, bottom: 10, left: 50.0),
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => PharmaLoading()));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffFAEEE2)),
                          shape: MaterialStateProperty.all(CircleBorder())),
                      child: Image.asset("assets/Find_A_Pet_Pharmacy.png",
                          width: 100, height: 100),
                    ),
                  ),
                  Text(
                    "Find a Pet \nPharmacy",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Vintage Style",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, top: 40.0, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => SocialLoading()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                      child: Image.asset("assets/Pet_Social.png",
                          width: 100, height: 100),
                    ),
                  ),
                  const Text(
                    "Pet Social",
                    style: TextStyle(fontSize: 18, fontFamily: "Vintage Style"),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
