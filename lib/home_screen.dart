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
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   leading: null,
        //   actions: <Widget>[
        //     IconButton(
        //         icon: Icon(Icons.close),
        //         onPressed: () {
        //           _auth.signOut();
        //           Navigator.pop(context);
        //
        //           //Implement logout functionality
        //         }),
        //   ],
        //
        //   title: Text('Home Page'),
        //   backgroundColor: const Color(0xff004AAD),
        // ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  height: 250,
                  width: 500,
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/caredance.png'))),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                // child: Text(
                //   "Welcome User",
                //   style: TextStyle(
                //     color: Color(0xffffffff),
                //     fontSize: 30,
                //     //fontWeight: FontWeight.w300,
                //     //fontFamily: "CassandraPersonalUseRegular",
                //     fontFamily: "Montserrat",
                //   ),
                // ),
              ),
              InkWell(
                onTap: () {Navigator.pushNamed(context, 'career_path');}, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 150,
                  width: 400,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    //   Text('Find your Career Path',
                    //     style: TextStyle(fontSize: 20.0, color: Colors.black),),
                    // ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/careerpath.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                child: Text(
                  "",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 01,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              InkWell(
                onTap: () {Navigator.pushNamed(context, 'mentors_list');}, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 150,
                  width: 400,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    //   Text('View Mentors',
                    //     style: TextStyle(fontSize: 20.0, color: Colors.black),),
                    // ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/mentor.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                child: Text(
                  "",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 01,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(25.0),
                onTap: () {Navigator.pushNamed(context, 'exams_list');}, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 150,
                  width: 400,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    //   Text('View Exams',
                    //     style: TextStyle(fontSize: 20.0, color: Colors.black),),
                    // ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/exams.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                child: Text(
                  "",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 01,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              InkWell(
                onTap: () {Navigator.pushNamed(context, 'news');}, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 150,
                  width: 400,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    //   Text('Job News',
                    //     style: TextStyle(fontSize: 20.0, color: Colors.black),),
                    // ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/jobnews.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}