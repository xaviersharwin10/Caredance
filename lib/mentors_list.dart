import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Mentors_list());
}

class Mentors_list extends StatelessWidget {
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
        title: Text("Mentors List"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
      dynamic conversationObject = {
      'appId': 'bd0eeed38d0918876b05ccc3a1f19037',// The APP_ID obtained from kommunicate dashboard.
      };
      KommunicateFlutterPlugin.buildConversation(conversationObject) .then((clientConversationId) { print("Conversation builder success : " + clientConversationId.toString()); }).catchError((error) { print("Conversation builder error : " + error.toString()); });
      },
          tooltip: "assistant button",
          child: Icon(Icons.message)
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg3.png"),
            fit: BoxFit.cover,
          ),
        ),

        child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('mentors').snapshots(),
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
                onTap:()=> UrlLauncher.launch("tel:${document['contact']}"),
                  title: new Text(document['name']),
                  subtitle: new Text(document['contact'])
              ),
                color: Colors.black54,
                elevation: 8,
                shadowColor: Colors.lightBlueAccent,
                margin: EdgeInsets.all(20),
              );
            }).toList(),
          );
        },
      ),
      ),
    );
  }
}