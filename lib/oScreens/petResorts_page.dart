import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/sizeConfig.dart';

class PetResortsPage extends StatefulWidget {
  const PetResortsPage({super.key});

  @override
  State<PetResortsPage> createState() => _PetResortsPageState();
}

class _PetResortsPageState extends State<PetResortsPage> {
  resortsTile() {
    return Row(
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
        //sBox(w: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VetCare Pet Cafe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
           // sBox(h: 1),
            Text(
              '2, Palm Breeze Rd,Hanuman Nagar\nTiming: 9:00 AM to 8:30pm',
              style: TextStyle(fontSize: 15),
            ),
          ],
        )
      ],
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
                'Best Pet Friendly Resorts\nNear Me',
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
                  return resortsTile();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
