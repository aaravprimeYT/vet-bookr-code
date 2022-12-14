// import 'package:flutter/material.dart';
// import 'Terms_And_Conditions.dart';

// class AboutScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("About Vet Bookr"),
//       ),
//       body: Column(
//         children: [
//           Flexible(
//             flex: 9,
//             child: SizedBox(
//               height: 500,
//               child: SingleChildScrollView(
//                 child: PageView(
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: Text("Hello Pet Parent!",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Greetings and thank you for your interest in Vet Bookr.",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "I am Aarav, 14 years old from Hyderabad, India. A brother to my cat that speaks and demands for time and food quite a lot, I am an animal lover. Vet Bookr is an App that I developed along with my coding mentor Harish over the last 6 months. We started on 17 Janurary 2022 with a goal to make Vet Bookr accessible to all pet parents of Hyderabad.",
//                           style: TextStyle(fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                         "When it comes to managing your pet’s health, it’s important to stay informed and organized. The Vet Bookr App makes keeping track of your pet’s health a breeze by putting all of their necessary information in one place. It’s a great tool for anyone with a single pet or multiple pets to connect with veterinarians in the neighbourhood and address the healthcare and other needs of pets such as Pet Boarding, Pet Care Takers, Pet Groomers, Pet Walkers etc., all of which shall be offered very soon.",
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Vet Bookr is currently available across Hyderabad, Telangana, India. It will be available in other locations in the near future.",
//                           style: TextStyle(fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Connect with a vet and receive healthcare services for your pet.",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Find a veterinarian or pet clinic in your neighbourhood, provide your details along with the symptoms of your pet, fix an appointment over call, show you pet over video call to the vet in case you cannot visit the clinic or fix an appointment and take your pet to the clinic for treatment.",
//                           style: TextStyle(fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text("Monitor your pet’s health.",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Manage your pet’s health by having health records accessible, keep track of their medications, plus note any allergies or medical alerts for quick reference. Have your pet’s doctor on call.",
//                           style: TextStyle(fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text("Access your pet’s information anytime.",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Get access to your pet’s medical records on your phone wherever you are! Need a vaccine record for your landlord, the dog park or a dog-friendly restaurant? Breathe a sigh of relief knowing that their information is just a few clicks away. It’s easy to share with other care providers while taking the best care of your pet.",
//                           style: TextStyle(fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "It’s the to do list for pet’s health management.",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Set reminders on everything your pet needs - from giving your pet medication to scheduling appointments to buying food and more.",
//                           style: TextStyle(fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Request Appointments and Prescription Refills.",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "If your veterinary practice partners with us, you can easily request appointments, medication refills, and products directly through the app.",
//                           style: TextStyle(fontSize: 12)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           bottom: 10.0, left: 10.0, right: 10.0),
//                       child: Text(
//                           "Download Vet Bookr to keep your dog, cat, rabbit, bird, turtle, or whoever your friend is, healthy and safe.",
//                           style: TextStyle(fontSize: 14)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//               flex: 1,
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => TermsScreen()));
//                   },
//                   child: Text("Next"))),
//         ],
//       ),
//     );
//   }
// }
