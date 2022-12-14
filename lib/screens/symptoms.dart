import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vet_bookr/screens/vetMaps.dart';
import 'package:vet_bookr/screens/list_pet.dart';
import 'package:vet_bookr/models/pet.dart';
import 'package:vet_bookr/screens/pet_ui.dart';

class Symptoms extends StatefulWidget {
  String petNames;

  Symptoms(this.petNames);

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  DateTime selectedDate = DateTime.now();

  String nameController = "";

  int ageController = 0;

  double weightController = 0;

  String breedController = "";

  String vaccinationDate = "";

  String symptomsController = "";

  _selectDate(BuildContext context) async {

    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
        selectedDate = selected;
    }
  }

  Future<DocumentReference> addPetToFireStore(petDetails) {
    return FirebaseFirestore.instance
        .collection('pets symptoms')
        .add(<String, dynamic>{
      "petName": widget.petNames,
      "symptoms": symptomsController,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptoms"),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.petNames,style: TextStyle(fontSize: 14, ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(hintText: "Pet's Symptoms"),
              onChanged: (symptoms) {
                symptomsController = symptoms;
              },
            ),
          ),

          Container(

              margin: const EdgeInsets.only(top: 90),
              child: ElevatedButton(
                  onPressed: () {
                    if (symptomsController.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text("The Field is empty"),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackBar);
                    } else {

                      addPetToFireStore(symptomsController);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VetsMaps()));
                    }
                  },
                  child: Text("Upload Pet")))

        ],
      ),
    );
  }
}


