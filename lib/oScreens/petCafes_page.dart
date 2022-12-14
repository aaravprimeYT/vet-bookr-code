import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/pharmacy.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/screens/vetMaps.dart';

class PetCafesPage extends StatefulWidget {
  const PetCafesPage({super.key});

  @override
  State<PetCafesPage> createState() => _PetCafesPageState();
}

class _PetCafesPageState extends State<PetCafesPage> {
  late Pharmacy pharmacy;
  cafeTile() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => VetsMaps()));
      },
      child: Row(
        children: [
          // Align(
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
         // sBox(w: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pharmacy.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
             // sBox(h: 1),
              Text(
                pharmacy.address,
                style: TextStyle(fontSize: 15),
              ),
             //sBox(h: 1),
              Text(
                pharmacy.timing.toString(),
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
             // sBox(h: 10),
              Text(
                'Best Pet Friendly Cafes\nNear Me',
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
                  return cafeTile();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
