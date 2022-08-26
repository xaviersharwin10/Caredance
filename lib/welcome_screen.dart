import 'package:flutter/material.dart';
import 'rounded_button.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.only(top: 600.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/caredancebg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
                children: <Widget>[
                  RoundedButton(
                    colour: const Color(0xff004AAD),
                    title: 'Log In',
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_screen');
                    },
                  ),
                  RoundedButton(
                      colour: const Color(0xff25AAD4),
                      title: 'Register',
                      onPressed: () {
                        Navigator.pushNamed(context, 'registration_screen');
                      }),
                ]),
          ),
        ),);
  }
}