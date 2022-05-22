import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testproject/career_path.dart';
import 'package:testproject/exams_list.dart';
import 'package:testproject/mentors_list.dart';
import 'package:testproject/news.dart';
import 'welcome_screen.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';


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
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(),
        'mentors_list': (context) => Mentors_list(),
        'career_path': (context) => Career_Path(),
        'exams_list': (context) => Exams_list(),
        'news': (context) => News()
      },
    );
  }
}