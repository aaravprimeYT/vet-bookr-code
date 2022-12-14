import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/oScreens/immunization_table.dart';
import 'package:vet_bookr/oScreens/menu_screen.dart';
import 'package:vet_bookr/oScreens/prescription_upload.dart';
import 'package:vet_bookr/screens/add_pet.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/models/pet.dart';

class AddPetHome extends StatefulWidget {
  const AddPetHome({super.key});

  @override
  State<AddPetHome> createState() => _AddPetHomeState();
}

String petName = "";
int petAge = 0;
double petWeight = 0;
String petBreed = "";
String vaccinationDate = "";

final nameController = TextEditingController();
final ageController = TextEditingController();
final breedController = TextEditingController();
final weightController = TextEditingController();

class _AddPetHomeState extends State<AddPetHome> {
  DateTime selectedDate = DateTime.now();

  final vaccinationController = TextEditingController();

  bool noImage = true;

  XFile? profilePic;
  ImagePicker imagePicker = ImagePicker();

  final storageRef = FirebaseStorage.instance.ref();

  Future<void> uploadPrescriptionToFirebase() async {
    try {
      final imageRef = storageRef.child(profilePic!.path);
      await imageRef.putFile(File(profilePic!.path));
    } on FirebaseException catch (e) {
      SnackBar snackBar = SnackBar(content: Text(e.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(3000),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // sBox(h: 10),
                  Text(
                    'My Pet Details',
                    style: TextStyle(color: Color(0xffF08519), fontSize: 22),
                  ),
                  //      myPetTile()
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      profilePic = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(() {

                      });
                    },
                    child: profilePic != null
                        ?
                    ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(height: 200, width: 200,child: Image.file(fit:BoxFit.cover,File("${profilePic?.path}",))))
                        : Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://media.gettyimages.com/id/1438489973/photo/border-collie-puppy-playing-in-the-grass-and-chewing-on-a-red-rope.jpg?s=1024x1024&w=gi&k=20&c=rgqJCSrgxNsGGMCyhDF6RpHqmqcC9xlc1zrD78c3VVU="))),
                          ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ...List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 25, right: 25, bottom: 10),
                      child: TextField(
                        controller: controllerChanger(index),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffFF8B6A)
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color(0xffFF8B6A)
                              )
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: hintTextChanger(index),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 25, right: 25),
                    child: TextField(
                        controller: vaccinationController,
                        onTap: () => {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime(DateTime.now().year - 4),
                                      lastDate: DateTime.now())
                                  .then((value) {
                                if (value == null) {
                                  return;
                                } else {
                                  vaccinationController.text =
                                      "Last Vaccination Date: ${value.day}/${value.month}/${value.year}";
                                }
                              })
                            },
                        readOnly: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color(0xffFF8B6A)
                              )
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: "Last Vaccination Date: ",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (name) {
                          setState(() {
                            vaccinationDate = vaccinationController as String;
                          });
                        }),
                  ),
                  buttonWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<DocumentReference> addPetToFireStore(Pet addedPet) {
    return FirebaseFirestore.instance
        .collection('petsDetails')
        .add(<String, dynamic>{
      "petName": addedPet.name,
      "petAge": addedPet.age,
      "petWeight": addedPet.weight,
      "petBreed": addedPet.breed,
      "vaccination": addedPet.vaccinationDates
    });
  }

  Widget buttonWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFF8B6A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrescriptionUpload()));
                  },
                  child: Text(
                    "Upload Pet Files",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
            ),
            Container(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5EBB86),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    if (petName.isEmpty || petAge == 0 || petBreed.isEmpty) {
                      const snackBar = SnackBar(
                        content: Text("One of these fields is empty"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuScreen()));
                      vaccinationDate =
                          "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                      Pet addedPet = Pet(
                          name: petName,
                          age: petAge,
                          weight: petWeight,
                          breed: petBreed);
                      addedPet.addVaccination(vaccinationDate);

                      var pet = Pet(
                          name: petName,
                          age: petAge,
                          weight: petWeight,
                          breed: petBreed);

                      uploadPrescriptionToFirebase();

                      addPetToFireStore(addedPet);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 330,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff65C4FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImmunizationTable()));
              },
              child: Text(
                "Immunization dates at a glance",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              )),
        ),
      ],
    );
  }
}

Widget imageWidget(image) {
  return image != null
      ? Image.file(
          File("${image?.path}"),
          fit: BoxFit.cover,
        )
      : ElevatedButton(onPressed: () {}, child: Text(""));
}

var controllers;

controllerChanger(index) {
  if (index == 0) {
    return controllers = nameController;
  }
  if (index == 1) {
    return controllers = ageController;
  }
  if (index == 2) {
    return controllers = breedController;
  }
  if (index == 3) {
    return controllers = weightController;
  }
}

var hintText = "";

hintTextChanger(index) {
  if (index == 0) {
    return hintText = "Name: ";
  }
  if (index == 1) {
    return hintText = "Age: ";
  }
  if (index == 2) {
    return hintText = "Breed: ";
  }
  if (index == 3) {
    return hintText = "Weight: ";
  }
}

var variableText;

variableChanger(index) {
  if (index == 0) {
    return variableText = petName;
  }
  if (index == 1) {
    return variableText = petAge;
  }
  if (index == 2) {
    return variableText = petBreed;
  }
  if (index == 3) {
    return variableText = petWeight;
  }
}