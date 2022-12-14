import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/vet_clinic.dart';
import 'package:vet_bookr/screens/vetMaps.dart';

import '../models/sizeConfig.dart';

class PetClinicsPage extends StatefulWidget {
  // PetClinicsPage(this.vetClinic);
  const PetClinicsPage({super.key});

  @override
  State<PetClinicsPage> createState() => _PetClinicsPageState();
}

class _PetClinicsPageState extends State<PetClinicsPage> {

  late VetClinic? vetClinic;


  clinicTile() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VetsMaps()));
      },
      child: Row(
        children: [
          //Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     margin: const EdgeInsets.all(5),
          //     height: SizeConfig.blockSizeHorizontal! * 30,
          //     width: SizeConfig.blockSizeHorizontal! * 30,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         color: Colors.redAccent[100]),
          //   ),
          // ),
        //  sBox(w: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vetClinic!.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
             // sBox(h: 1),
              Text(
                vetClinic!.address,
                style: TextStyle(fontSize: 15),
              ),
              //sBox(h: 1),
              Text(
                vetClinic!.timing.toString(),
                style: TextStyle(fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //  sBox(h: 10),
              Text(
                'Veterinary Clinics\nNear Me',
                style: TextStyle(color: Colors.deepOrange[300], fontSize: 22),
              ),
              Divider(
                thickness: 4,
                color: Colors.deepOrange[300],
                endIndent: 200,
              ),
              // sBox(h: 1),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: ((context, index) {
                  return clinicTile();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
