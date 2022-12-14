import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/pet.dart';
import 'package:vet_bookr/presentation/appbar.dart';
import 'package:vet_bookr/presentation/banner.dart';
import 'package:vet_bookr/presentation/bottom_navigation_bar.dart';
import 'package:vet_bookr/presentation/categories_list.dart';
import 'package:vet_bookr/presentation/pets_list.dart';
import 'package:vet_bookr/screens/add_pet.dart';
import 'package:vet_bookr/screens/pet_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_bookr/screens/symptoms.dart';
import 'package:vet_bookr/size_confige.dart';

class ListPets extends StatefulWidget {
  @override
  State<ListPets> createState() => _ListPetsState();
}

// final Stream<QuerySnapshot> _usersStream =
//     FirebaseFirestore.instance.collection('petsDetails').snapshots();

@override
class _ListPetsState extends State<ListPets> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h / 20),
              const DoctorAppBar(),
              SizedBox(height: h / 20),
              const DoctorBanner(),
              SizedBox(height: h / 20),
              const CategoriesList(),
              SizedBox(height: h / 20),
              const PetsList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // centerIcon: Icons.place,
        itemIcons: [
          Icons.pets_outlined,
          Icons.local_hospital_outlined,
          Icons.hotel_class_outlined,
          Icons.local_pharmacy_outlined,
        ],
      ),
    );

    //   return StreamBuilder<QuerySnapshot>(
    //     stream: _usersStream,
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return Text('Something went wrong');
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Text("Loading");
    //       }

    //       return Scaffold(
    //         body: Stack(
    //           children: <Widget>[
    //             Padding(
    //                 padding: EdgeInsets.only(bottom: bottomNavBarHeight),
    //                 child: ListView(
    //                   children:
    //                       snapshot.data!.docs.map((DocumentSnapshot document) {
    //                     Map<String, dynamic> data =
    //                         document.data()! as Map<String, dynamic>;
    //                     return PetUi(
    //                       petName: data["petName"],
    //                       age: data["petAge"],
    //                     );
    //                   }).toList(),
    //                 )),
    //             Align(alignment: Alignment.bottomCenter, child: bottomNav())
    //           ],
    //         ),
    //         floatingActionButton: FloatingActionButton(
    //           onPressed: () {
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => AddPetScreen()));
    //           },
    //           child: Icon(Icons.add),
    //         ),
    //       );
    //     },
    //   );
    // }

    // Widget bottomNav() {
    //   return CircularBottomNavigation(
    //     tabItems,
    //     controller: _navigationController,
    //     selectedPos: selectedPos,
    //     barHeight: bottomNavBarHeight,
    //     barBackgroundColor: Colors.white,
    //     backgroundBoxShadow: <BoxShadow>[
    //       BoxShadow(color: Colors.black45, blurRadius: 10.0),
    //     ],
    //     animationDuration: Duration(milliseconds: 300),
    //     selectedCallback: (int? selectedPos) {
    //       setState(() {
    //         this.selectedPos = selectedPos ?? 0;
    //         print(_navigationController.value);
    //       });
    //     },
    //   );
  }
}
