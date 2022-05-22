import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';
import 'article_model.dart';
import 'api_service.dart';

User? loggedinUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);

                  //Implement logout functionality
                }),
          ],

          title: Text('Home Page'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(

                  "Welcome User",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                ),
                RoundedButton(

                  title: 'Find your Career Path!',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'career_path');
                  },

                ),
                const SizedBox(height: 9),
                RoundedButton(
                  title: 'View Mentors',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'mentors_list');
                  },
                ),
                const SizedBox(height: 9),
                RoundedButton(
                  title: 'View Exams',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'exams_list');
                  },
                ),
                const SizedBox(height: 9),
                RoundedButton(

                  title: 'Job News',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, 'news');
                  },

                ),



              ]

          ),
        )
    );
  }
}