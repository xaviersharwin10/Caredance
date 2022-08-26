import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';


//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.white),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));

class MentorLogin extends StatefulWidget {
  @override
  _MentorLoginState createState() => _MentorLoginState();
}

final _auth = FirebaseAuth.instance;

class _MentorLoginState extends State<MentorLogin> {
  var snackBar = SnackBar(
    content: Text('Invalid Login!'),
  );
  String? email;
  String? password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.only(top: 100.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bluebg2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Mentors')
                      .where('username', isEqualTo: email).where('password', isEqualTo: password)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                    }
                    var al = snapshot.data!.docs[0].get("username").toString();
                    var bl = snapshot.data!.docs[0].get("password").toString();
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                email = value;
                                //Do something with the user input.
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Enter your email',
                              )),
                          SizedBox(
                            height: 8.0,
                          ),
                          TextField(
                              obscureText: true,

                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                password = value;
                                //Do something with the user input.
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Enter your password.')),
                          SizedBox(
                            height: 24.0,
                          ),
                          RoundedButton(
                              colour: const Color(0xff004AAD),
                              title: 'Log In',
                              onPressed: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                if(al==email && bl==password){
                                  Navigator.pushNamed(context, 'login_screen');
                                  print("Yes");
                                }
                                else{
                                  Navigator.pushNamed(context,'welcome_screen');
                                  print("No");
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              }),
                        ],
                      ),

                    );
                  })
          ),
        )
    );
  }
}