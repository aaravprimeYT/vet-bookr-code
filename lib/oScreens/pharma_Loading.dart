import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/oScreens/petClinics_page.dart';

class PharmaLoading extends StatefulWidget {
  const PharmaLoading({super.key});

  @override
  State<PharmaLoading> createState() => _PharmaLoadingState();
}

class _PharmaLoadingState extends State<PharmaLoading> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xffFFD9B3),
      body: Column(
        children: [
          Container(
            height: 100,
            width: SizeConfig.screenWidth,
            child: Image.asset(
              'assets/pharmacyloadingscreen.png',
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Color(0xffFF8B6A))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PetClinicsPage()));
              },
              child: Text("Find a Pet Pharmacy near me",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
