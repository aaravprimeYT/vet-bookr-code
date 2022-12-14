import 'package:vet_bookr/oScreens/menu_screen.dart';

import '/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PV2 extends StatefulWidget {
  final FirebaseAuth auth;

  const PV2({Key? key, required this.auth}) : super(key: key);

  @override
  State<PV2> createState() => _PV2State();
}

class _PV2State extends State<PV2> {
  String globalVerificationId = "";

  bool otpNotSent = true;
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(32),
          child: otpNotSent
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Phone Number"),
                      controller: _phoneController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_phoneController.text.isEmpty) {
                            const snackBar =
                                SnackBar(content: Text("Phone No is empty"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            verifyPhoneNo(_phoneController.text);
                          }
                        },
                        child: const Text("Get OTP")),
                    ElevatedButton(onPressed: (){
                      User  user = widget.auth.currentUser!;

                       var snackBar = SnackBar(
                          content: Text("${user.email} has signed up"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }, child: const Text("Get User"))
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Enter OTP"),
                      controller: _otpController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_otpController.text.isEmpty) {
                            const snackBar = SnackBar(
                                content: Text("Empty OTP cannot be sent"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            validateOTP(_otpController.text);
                          }
                        },
                        child: const Text("Submit OTP"))
                  ],
                )),
    );
  }



  verifyPhoneNo(String phoneNo) async {


    await widget.auth.verifyPhoneNumber(
        phoneNumber: phoneNo,

        verificationCompleted: (PhoneAuthCredential credential) async{

          var existingUser =  widget.auth.currentUser;


          //After the User SignsIn
          await existingUser?.linkWithCredential(credential).then((value) {

            const snackBar = SnackBar(
                content: Text("User Signed In SuccessFully"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          });


        },
        /**
         * Handles only invalid phone no.s or if sms quota expired
         */
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            const snackBar = SnackBar(
                content: Text('The provided phone number is not valid.'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

        },
        codeSent: (String verificationId, int? resendToken) async{
          setState(() {
            otpNotSent = false;
            globalVerificationId = verificationId;
          });
    const snackBar = SnackBar(
    content: Text('OTP Sent.'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);


        },
        codeAutoRetrievalTimeout: (String verificationId) {

        });
  }

  validateOTP(String otp) async{
    //Validate the OTP by calling a function in Auth

    try {
      User user = widget.auth.currentUser!;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: globalVerificationId, smsCode: otp);
      user.linkWithCredential(credential);

      await widget.auth.signInWithCredential(credential).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MenuScreen()),
        );
      });
    }
    on FirebaseAuthException catch(e) {
      if(e.code=="invalid-verification-code"){
        const snackBar = SnackBar(
            content: Text("Invalid OTP. Please Enter Correct OTP"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}
