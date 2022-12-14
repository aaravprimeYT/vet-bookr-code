import 'package:flutter/material.dart';
import 'package:vet_bookr/data/data.dart';

import '../constant.dart';
import '../size_confige.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
        height: h / 100,
        child: ListView.builder(
          itemCount: Data.doctorsList.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: w / 35),
          itemBuilder: (context, index) {
            final category = Data.doctorsList[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: h / 2,
                    constraints: BoxConstraints(minWidth: w / 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w / 3),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(w / 25),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    kCategoriesPrimaryColor[index],
                                    kCategoriesSecondryColor[index],
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            // child: Icon(
                            //   category.image,
                            //   color: Colors.white,
                            //   size: getRelativeWidth(0.075),
                            // )
                          ),
                          Text(
                            "Recent Clinics",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: w / 55,
                            ),
                          ),
                          // SizedBox(width: w / ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category.name.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: h / 5),
                              Text(
                                category.speciality.toString(),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.48),
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: w / 4)
              ],
            );
          },
        ));
  }
}
