import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Exams_list());
}

class Exams_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Firebase',
      home: AddData(),
    );
  }
}

class AddData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Exams"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Exams').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Card(
              child:ListTile(
                  title: new Text(document.id),
                  subtitle: new Text(document['required_for'])
              ),
                color: Colors.black54,
                elevation: 4,
                shadowColor: Colors.lightBlueAccent,
                margin: EdgeInsets.all(20),
              );
            }).toList(),
          );
        },
      ),),
    );
  }
}