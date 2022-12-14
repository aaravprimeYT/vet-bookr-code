import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/oScreens/SocialFilter.dart';
import 'package:vet_bookr/oScreens/petClinics_page.dart';

class SocialLoading extends StatefulWidget {
  const SocialLoading({super.key});

  @override
  State<SocialLoading> createState() => _SocialLoadingState();
}

class _SocialLoadingState extends State<SocialLoading> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xffFFD9B3),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(80),
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Image.asset(
              'assets/social_loading.png',
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xffFF8B6A))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PetSocialFilter()));
              },
              child: Text("Find more fun for your pet",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        ],
      )),
    );
  }
}
