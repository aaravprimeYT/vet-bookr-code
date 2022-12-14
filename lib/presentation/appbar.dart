import 'package:flutter/material.dart';

import '../size_confige.dart';

class DoctorAppBar extends StatelessWidget {
  const DoctorAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h / 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, Hosain",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              SizedBox(height: h / 3),
              Text(
                "Find A Pet Doctor & Specialist easily",
                style: TextStyle(color: Colors.blueGrey[400], fontSize: 20),
              ),
            ],
          ),
          Container(
            height: h / 6,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(0, 4),
                    color: Colors.black54,
                  )
                ],
                color: Color(0xffA295FD),
                borderRadius: BorderRadius.circular(5)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset("assets/aboutscreen.png")),
          )
        ],
      ),
    );
  }
}
