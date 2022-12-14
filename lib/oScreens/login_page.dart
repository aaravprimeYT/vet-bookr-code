import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/oScreens/home_page.dart';


import '../screens/phone_verification_2.dart';
import 'menu_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  String email = "";
  String _password = "";

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    emailController.dispose();
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
        MaterialPageRoute(builder: (context) => PV2(auth: _auth)),
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

  tField({String? hText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 75, vertical: 6),
      child: SizedBox(
        width: 250,
        height: 40,
        child: TextFormField(
          style: TextStyle(fontSize: 15),
          controller: emailController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            hintText: hText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  tpField({String? hText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 75, vertical: 6),
      child: SizedBox(
        width: 250,
        height: 40,
        child: TextFormField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            hintText: hText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                Image.asset(
                "assets/logo.png",
                width: 250,
                height: 150,
              ),

            //sBox(h: 3),
            tField(hText: 'Email'),
            tpField(hText: 'Password'),
            //sBox(h: 2),


            TextButton(
              style: TextButton.styleFrom(
                //fixedSize: Size(SizeConfig.blockSizeHorizontal! * 30,
                //  SizeConfig.blockSizeVertical! * 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color(0xffFF8B6A)),
              onPressed: () {
                setState(() {
                  _password = passwordController.text;
                  email = emailController.text;
                });
                if (email.isEmpty || _password.isEmpty) {
                  const snackBar = SnackBar(
                    content: Text("One of these fields is empty"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  setState(() {
                    // if (rememberMe != true) {
                    //   setState(() => showErrorMessage = true);
                    // } else {
                    //   setState(() => showErrorMessage = false);

                    signInUser(email, _password);
                    // }
                  });
                }
              },
              // onPressed: () {
              //   Navigator.pushReplacement(
              //       context, MaterialPageRoute(builder: (context) => HomePage()));
              // },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )
    ),
]
    )
    ,
    );
  }
}
