import 'package:vet_bookr/screens/phone_verification_2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  //Completed: Add an email parameter and a constructor

  String email;

  SignUp(this.email);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //Completed: Call the email parameter, remove _email and emailEditingController
  //Completed: Remove TextForm Field for email and replace it with a list tile.

  String _password = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signupUser(String email, String password) async {
    User? user;

    /**
     * Link credentials to the user.
     */

    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    user = userCredential.user;

    var bar = SnackBar(content: Text("${user?.email} has signed up"));
    ScaffoldMessenger.of(context).showSnackBar(bar);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PV2(auth: _auth)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffFFD9B3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png"),
            ListTile(
              title: Text(widget.email),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              onChanged: (name) {
                setState(() {
                  _password = name;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (widget.email.isEmpty || _password.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text("One of these fields is empty"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    setState(() {
                      signupUser(widget.email, _password);
                    });
                  }
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
