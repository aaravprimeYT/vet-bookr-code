import 'package:vet_bookr/screens/home_screen.dart';
import 'package:vet_bookr/screens/list_pet.dart';
import 'package:flutter/material.dart';
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: SingleChildScrollView(
              child: PageView(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("At Vet Bookr, we take the privacy and security of pet owners ('Pet Parents') seriously. This Privacy Policy is designed to explain how we collect, use, and share information gathered through our mobile App Vet Bookr.. You agree to the terms and conditions of this Privacy Policy. Beyond the Privacy Policy, your use of the Services is also subject to our Terms of Service.", style: TextStyle(fontSize: 14)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Information You Provide Us", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("By submitting personal information relating to yourself, you represent that you have the authority to do so and to permit us to use the information by this Privacy Policy.", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Pet Parent Registration Information:", style: TextStyle(fontSize: 13)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text(" When you sign up for a Vet Bookr account as a Pet Parent, you provide us with information about yourself, including:", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Name", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Age", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Address", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Phone Number", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Pet Information:", style: TextStyle(fontSize: 13)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Pet characteristics (including but not limited to photo, name, breed, and allergy information and others.", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Payment for Services and Purchase Information:",style: TextStyle(fontSize: 13)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("As a pet parent, each time you utilize the services of a veterinarian or clinic, you are to settle your dues as per the agreed terms of the service deliverer.", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Vet Bookr is a free platform that connects you with the service provider and has no commercial benefit whatsoever.", style: TextStyle(fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Information We Collect Automatically From Your Use of Services", style: TextStyle(fontSize: 14),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Vet Bookr is hosted on PlayStore and App Store. We urge you to read up on their privacy policies as this might apply in addition to the Vet Bookr Privacy Policy shared in this document.", style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("How We Use Your Information", style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("We may use the information we collect about Pet Parents:", style: TextStyle(fontSize: 13),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("To operate, maintain, enhance and provide features and information that you request, to fulfill our services, to respond to comments and questions, and otherwise to provide support to users.", style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("To understand and analyze the usage trends and preferences of our users, to improve and develop new features, and functionality.", style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Third-Party Services", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("This Privacy Policy does not address, and we are not responsible for, the privacy, information or other practices of any third parties, including any third party operating any site. The inclusion does not imply endorsement of the linked site  by us or by our affiliates.", style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Security", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("We use certain technical safeguards that are designed to maintain the integrity and security of information that we collect. Please be aware that no security measures are perfect or impenetrable and thus we cannot and do not guarantee the security of your data. It is important that you maintain the security and control of your account credentials, and not share your password with anyone.", style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Use of Services by Minors", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("The Services are not directed to individuals under the age of thirteen (13), and we request that they not provide personal information through the Services.", style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Updates to This Privacy Policy", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("We may make changes to this Privacy Policy. The 'Last Updated' date at the top of this page indicates when this Privacy Policy was last revised. If we make material changes, we may notify you through the app. We encourage you to read this Privacy Policy periodically to stay up-to-date about our privacy practices. Your use of the Services following these changes means that you accept the revised Privacy Policy.", style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("Contact Us", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
                    child: Text("If you have any questions about this Privacy Policy, please contact us at info@vetbookr.com", style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
            ),
          ),
          Flexible(flex: 1,child: ElevatedButton(onPressed: ()
          {Navigator.push(context,MaterialPageRoute(builder: (context) => ListPets()));},
              child: Text("Next"))),
        ],
      ),
    );
  }
}
