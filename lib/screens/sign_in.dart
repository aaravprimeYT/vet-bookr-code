import 'package:vet_bookr/screens/Privacy_Policy.dart';
import 'package:vet_bookr/screens/about_vet_bookr.dart';
import 'package:vet_bookr/screens/list_pet.dart';
import '../widgets/termsdialog.dart';
import '/screens/home_screen.dart';
import '/screens/phone_verification_2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  String email;

  SignIn(this.email);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _password = "";
  bool rememberMe = false;
// this bool will check rememberMe is checked
  bool showErrorMessage = false;

  final passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signInUser(String email, String password) async {
    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      var bar = SnackBar(content: Text("${user?.email} is signed in"));

      ScaffoldMessenger.of(context).showSnackBar(bar);

      /**
       * Go to Phone Verification
       */
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListPets()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const snackBar = SnackBar(content: Text("User not found"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        const snackBar2 = SnackBar(content: Text("Incorrect Password"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar2);
      }
    }
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
              controller: passwordController,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Terms & Conditions'),
                        content: SizedBox(
                          height: 500,
                          child: Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 12,
                              child: Container(
                                color: const Color(0xffFFD9B3),
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 9,
                                      child: SingleChildScrollView(
                                        child: PageView(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                  "This document sets forth the Terms and Conditions for use of the Application operated by Vet Bookr. You hereby acknowledge and agree to the Terms and Conditions for Vet Bookr. You further specifically agree that you are responsible for any risks, of all Pet Owners and others using the Vet Bookr App to contact a clinic and/or vet pharmacy with whom they have established a relationship.",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PrivacyScreen()));
                                            },
                                            child: Text("Next"))),
                                  ],
                                ),
                              )),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Go Back'))
                        ],
                      ),
                    );
                  },
                  child: const Text('Accept Terms & Conditions')),
              const SizedBox(width: 20.0),
              Checkbox(
                  focusColor: Colors.lightBlue,
                  activeColor: Colors.orange,
                  value: rememberMe,
                  onChanged: (newValue) {
                    setState(() => rememberMe = newValue!);
                  })
            ]),
            // based up on this bool value
            showErrorMessage
                ? Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(80.0)),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            'Please accept the terms and conditions to proceed...')))
                : Container(),
            SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _password = passwordController.text;
                  });
                  if (widget.email.isEmpty || _password.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text("One of these fields is empty"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    setState(() {
                      if (rememberMe != true) {
                        setState(() => showErrorMessage = true);
                      } else {
                        setState(() => showErrorMessage = false);

                        signInUser(widget.email, _password);
                      }
                    });
                  }
                },
                child: Text("Sign In"))
          ],
        ),
      ),
    );
  }
}
