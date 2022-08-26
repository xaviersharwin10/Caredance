import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testproject/career_path.dart';
import 'package:testproject/exams_list.dart';
import 'package:testproject/mentors_list.dart';
import 'package:testproject/news.dart';
import 'package:testproject/parent_first_screen.dart';
import 'package:testproject/welcome_screen_1.dart';
import 'welcome_screen.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'mentor_registration.dart';
import 'parent_registration.dart';
import 'parent_welcome.dart';
import 'parent_login.dart';
import 'mentor_login.dart';
import 'mentor_welcome.dart';
import 'quiz1.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: 'welcome_screen_1',
      routes: {
        'welcome_screen_1': (context) => WelcomeScreen1(),
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(),
        'mentors_list': (context) => Mentors_list(),
        'career_path': (context) => Career_Path(),
        'exams_list': (context) => Exams_list(),
        'news': (context) => News(),
        'parent_registration': (context) => ParentRegistration(),
        'parent_welcome': (context) => ParentWelcome(),
        'parent_login': (context) => ParentLogin(),
        'mentor_registration': (context) => MentorRegistration(),
        'mentor_login': (context) => MentorLogin(),
        'mentor_welcome': (context) => MentorWelcome(),
        'parent_first_screen': (context) => ParentFirstScreen(),
        'quiz1':(context)=> Quiz1()

      },
    );
  }
}