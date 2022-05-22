import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';
import 'article_model.dart';
import 'api_service.dart';
import 'customListTile.dart';

User? loggedinUser;

class News extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<News> {
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

        title: Text('News'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:
      FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData){
            List<Article>? articles = snapshot.data;
            return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index) => customListTile(articles![index], context)

            );
            // print(snapshot.data);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Has DAta!"),
            ));
          }
          return Center(
            child:CircularProgressIndicator(),
          );
        },
      ),




    );
  }
}