import 'package:flutter/material.dart';
import 'rounded_button.dart';
class WelcomeScreen1 extends StatefulWidget {
  @override
  _WelcomeScreen1State createState() => _WelcomeScreen1State();
}

class _WelcomeScreen1State extends State<WelcomeScreen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 510.0),
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
                  title: 'Student',
                  onPressed: () {
                    Navigator.pushNamed(context, 'welcome_screen');
                  },
                ),
                RoundedButton(
                    colour: const Color(0xff25AAD4),
                    title: 'Parent',
                    onPressed: () {
                      Navigator.pushNamed(context, 'parent_welcome');
                    }),
                RoundedButton(
                    colour: const Color(0xff03F5F8),
                    title: 'Mentor',
                    onPressed: () {
                      Navigator.pushNamed(context, 'mentor_welcome');
                    })
              ]),
        ),

        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 24.0),

      ),);
  }
}