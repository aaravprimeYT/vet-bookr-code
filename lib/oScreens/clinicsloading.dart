import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/oScreens/petClinics_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xffFFD9B3),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(80),
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Image.asset(
              'assets/clinicloadingscreen.png',
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Color(0xffFF8B6A))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PetClinicsPage()));
              },
              child: Text("Find a Vet near me",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          ElevatedButton(onPressed: (){}, child: Text("Enter location where you need a Vet", style: TextStyle(color: Color(0xffD4F0FF)),))
        ],
      )),
    );
  }
}
