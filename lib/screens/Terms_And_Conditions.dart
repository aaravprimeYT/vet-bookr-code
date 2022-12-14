import 'package:flutter/material.dart';
import 'Privacy_Policy.dart';

class TermsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Terms And Conditions",
            style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Column(
          children: [
          Flexible(
          flex: 9,
          child: SingleChildScrollView(
            child: PageView(
              children: const [Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    "This document sets forth the Terms and Conditions for use of the Application operated by Vet Bookr. You hereby acknowledge and agree to the Terms and Conditions for Vet Bookr. You further specifically agree that you are responsible for any risks, of all Pet Owners and others using the Vet Bookr App to contact a clinic and/or vet pharmacy with whom they have established a relationship.",
                    style: TextStyle(fontSize: 14)),
              ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text("1. Ability to Contract.", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                      "You agree that you are in a condition to agree to be bound by these terms and conditions.",
                      style: TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text("2. Account", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                      "To participate in the Vet Bookr App, you must create an account. When creating your account, you agree to provide complete and accurate information. You shall be responsible for maintaining the secrecy of your username and password, and Vet Bookr accepts no responsibility for unauthorized use of the same. You agree not to use any username or password not belonging to you.",
                      style: TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text("3. Fees for Service", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                      "Vet Booker is a free-to-use platform and does not make any money for proving information nor charge for its services. Pet Parents/Clients are to pay Veterinarians/Clinics/Pharmacies/Others directly as Vet Bookr does not provide any payment gateway for such payments. Vet Bookr will not be liable to compensate veterinarians and pharmacies for any services rendered or product sale. Vet Bookr connects pet parents to clinics/pharmacies/Pet-friendly places for free and does not collect any payments from pet parents nor the service and product providers.",
                      style: TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text("4. Intellectual Property", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                      "All content on Vet Bookr App, including but not limited to images, text, code, graphical designs, and logos are the sole property of Vet Bookr. Unauthorized use, reproduction, distribution, display, or creation of derivative materials is prohibited and could subject you to civil and/or criminal liability. Your use of the Vet Bookr App does not create any interest in the intellectual property of Vet Bookr. You agree that you will not use the Vet Bookr App for any purpose other than the use described above, and have no authority to use the content of the Vet Bookr App, for any purpose other than those expressly provided by Vet Bookr.",
                      style: TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text("5. Modifications", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                      "Vet Bookr reserves the right to change the privacy policy at any time.",
                      style: TextStyle(fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text("7. Termination of Account", style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                      "Vet Bookr has the exclusive right to terminate your account for any reason, at any time.",
                      style: TextStyle(fontSize: 12)),
                ),
                Text("8. No Warranty", style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold)),
                Text(
                    "You agree that your use of the Vet Bookr App shall be at your sole risk. To the fullest extent permitted by law, Vet Bookr, its founder, and stakeholders disclaim all warranties, express or implied, in connection with the Vet Bookr App and your use thereof. Vet Bookr makes no warranties or representations about the accuracy or completeness of this Vet Bookr App's content, the content of any sites linked to this Vet Bookr App, and assumes no liability or responsibility for any (i) errors, mistakes, or inaccuracies of content, (ii) personal injury or property damage, or any nature whatsoever, resulting from your access to and use of our Vet Bookr App, (iii) any unauthorized access to all personal information stored in the App, (iv) any interruption or cessation of transmission to or from our Vet Bookr App, (v) any bugs, viruses, or the like that may be transmitted to or through our Vet Bookr App by any third party, (vi) for any loss or damage of any kind incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available via the Vet Bookr App.",
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
        Flexible(flex: 1,child: ElevatedButton(onPressed: ()
        {Navigator.push(context,MaterialPageRoute(builder: (context) => PrivacyScreen()));},
        child: Text("Next"))),
    ]
    ,
    )
    ,
    );
  }
}
