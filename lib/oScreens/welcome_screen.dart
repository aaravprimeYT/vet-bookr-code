import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/oScreens/signup_page.dart';

import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 25),
              child: Image.asset(
                "assets/logo.png",
                height: 110,
                width: 250,
              ),
            ),
            //sBox(h: 2),
              Image.asset("assets/welcome.png", width: 125, height: 35,),
            //sBox(h: 2),
            const Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Padding(
                padding: EdgeInsets.only(left: 45.0, right: 45.0),
                child: Text(
                  "Vet Bookr is the all-in-one app for \npet parents to find a vet, pet-friendly places and pharmacies nearby, with the unique convenience of storing your pet's health records in one place for the future reference.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      height: 1.4,
                      fontSize: 13),
                ),
              ),
            ),
            //sBox(h: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      //fixedSize: Size(SizeConfig.blockSizeHorizontal! * 20,
                        //  SizeConfig.blockSizeVertical! * 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.green[400]),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      //fixedSize: Size(SizeConfig.blockSizeHorizontal! * 20,
                        //  SizeConfig.blockSizeVertical! * 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.deepOrange[300]),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
           // sBox(h: 2),
            Image.asset(
              'assets/homepage.png',
              scale: 2.5,
            )
          ],
        ),
      ),
    );
  }
}
