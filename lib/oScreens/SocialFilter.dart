import 'package:flutter/material.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/oScreens/petCafes_page.dart';
import 'package:vet_bookr/oScreens/petClinics_page.dart';
import 'package:vet_bookr/oScreens/petResorts_page.dart';
import 'package:vet_bookr/oScreens/petRestaurants_page.dart';
import 'package:vet_bookr/oScreens/petTrainers_page.dart';

class PetSocialFilter extends StatelessWidget {
  const PetSocialFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
            child: Text(
              'Find more fun for your pet',
              style: TextStyle(color: Colors.deepOrange[300], fontSize: 22),
            ),
          ),
          Divider(
            thickness: 4,
            color: Colors.deepOrange[300],
            endIndent: 65,
            indent: 70,
          ),
          Row(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 50.0, top: 15.0, bottom: 10, left: 50.0),
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetResortsPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Image.asset("assets/vacations.png",
                        width: 100, height: 100),
                  ),
                ),
                const Text(
                  "Resorts",
                  style: TextStyle(fontSize: 18, fontFamily: "Vintage Style"),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 0.0, top: 15.0, bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetClinicsPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Image.asset("assets/cafes.png",
                        width: 100, height: 100),
                  ),
                ),
                const Text(
                  "Cafes",
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
                      right: 50.0, top: 15.0, bottom: 10, left: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetRestaurantsPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Image.asset("assets/restaurants.png",
                        width: 100, height: 100),
                  ),
                ),
                Text(
                  "Restaurants",
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
                      const EdgeInsets.only(left: 0.0, top: 15.0, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetTrainersPage()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffFAEEE2)),
                      shape: MaterialStateProperty.all(CircleBorder()),
                    ),
                    child: Image.asset("assets/trainers.png",
                        width: 100, height: 100),
                  ),
                ),
                const Text(
                  "Trainers",
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
                      right: 50.0, top: 15.0, bottom: 10, left: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetResortsPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Image.asset("assets/boarding.png",
                        width: 100, height: 100),
                  ),
                ),
                const Text(
                  "Boarding",
                  style: TextStyle(fontSize: 18, fontFamily: "Vintage Style"),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 0.0, top: 15.0, bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetClinicsPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Image.asset("assets/cafes.png",
                        width: 100, height: 100),
                  ),
                ),
                const Text(
                  "Grooming",
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
                      right: 50.0, top: 15.0, bottom: 10, left: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetRestaurantsPage()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xffFAEEE2)),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Image.asset("assets/walkers.png",
                        width: 100, height: 100),
                  ),
                ),
                Text(
                  "Walkers",
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
                  const EdgeInsets.only(left: 0.0, top: 15.0, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetTrainersPage()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xffFAEEE2)),
                      shape: MaterialStateProperty.all(CircleBorder()),
                    ),
                    child: Image.asset("assets/trainers.png",
                        width: 100, height: 100),
                  ),
                ),
                const Text(
                  "Parks",
                  style: TextStyle(fontSize: 18, fontFamily: "Vintage Style"),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
