import 'package:vet_bookr/screens/sign_in.dart';
import 'package:vet_bookr/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DynamicUserValidation extends StatefulWidget {
  const DynamicUserValidation({Key? key}) : super(key: key);

  @override
  State<DynamicUserValidation> createState() => _DynamicUserValidationState();
}

class _DynamicUserValidationState extends State<DynamicUserValidation> {
  final myController = TextEditingController();

  String _email = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  validateUser(String email) async {
    var tasks = await _auth.fetchSignInMethodsForEmail(email);

    if (tasks.isEmpty) {
      //Completed: Navigate to Signup Screen with the email
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp(email)));
    } else {
      //Completed: Navigate to SignIn Screen with the email
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn(email)));
    }

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }
    // @override
    // Widget build(BuildContext context) {
    //   return WillPopScope(
    //     onWillPop: () async {
    //       print("Back pressed");
    //       var result = await _onBackPressed(context);

    //       /**
    //        * If the result is null, return false
    //        */
    //       return result ?? false;
    //     },
    //     child: Scaffold(
    //       body: Container(),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("Back pressed");
        var result = await _onBackPressed(context);

        /**
         * If the result is null, return false
         */
        return result ?? false;
      },
      child: Scaffold(
        body: Container(
          color: const Color(0xffFFD9B3),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Enter your email"),
                  controller: myController,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _email = myController.text;
                        });
                        if (_email.isEmpty) {
                          const snackBar = SnackBar(
                            content: Text("Email is empty"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          validateUser(_email);
                        }
                      },
                      icon: const Icon(Icons.arrow_forward))),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _onBackPressed(BuildContext context) {
    // show Dialog will return the boolean value

    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Are you sure?"),
              title: Text("Do you want to exit"),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("No")),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Yes"))
              ],
            ));
  }
}
