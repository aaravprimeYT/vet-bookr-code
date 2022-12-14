  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vet_bookr/constant.dart';
import 'package:vet_bookr/models/sizeConfig.dart';
import 'package:vet_bookr/oScreens/menu_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => PV2(auth: _auth)),
    // );
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
            child: Image.asset(
              "assets/logo.png",
              width: 250,
              height: 150,
            ),
          ),
          //sBox(h: 3),
          tField(hText: 'Email'),
          tpField(hText: 'Password'),
          //sBox(h: 2),
          TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color(0xff5EBB86)),
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
                  signupUser(email, _password);
                  // }
                });
              }
            },
            // },
            child: const Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
