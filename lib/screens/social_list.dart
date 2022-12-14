import 'package:vet_bookr/models/social.dart';
import 'package:flutter/material.dart';
import 'package:vet_bookr/screens/socialDetails.dart';

class SocialList extends StatelessWidget {
  Social social;

  SocialList(this.social);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vet List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                title: Text(social.name),
                subtitle: Text("${social.timing}"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SocialDetails(social)));
                },
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                title: Text("${social.name}"),
                subtitle: Text("${social.timing}"),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                title: Text("${social.name}"),
                subtitle: Text("${social.timing}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
