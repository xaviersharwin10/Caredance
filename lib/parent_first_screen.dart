import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
void main() {
  runApp(MaterialApp( home: ParentFirstScreen(),));
}

class ParentFirstScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ParentFirstScreen> {
  @override
  String value = "";
  String value1= "";
  String value2= "";
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enter your details'),
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
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bluebg1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the domain you want your child to be in',
                      hintText: 'Domain',
                    ),
                    onChanged: (text) {
                      value = text;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Where are you located',
                      hintText: 'Enter your location',
                    ),
                    onChanged: (text) {
                      value1 = text;
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),

                  child: TextField(
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Preffered Fee Structure',
                      hintText: 'Fee Structure',

                    ),
                    onChanged: (text) {
                      value2 = text;
                    },
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Submit'),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParentResults(text1: value,text2: value1,text3: value2),
                        ));
                  },
                )
              ],
            )
        )
    );
  }
}

class ParentResults extends StatefulWidget {
  const ParentResults({Key? key, required this.text1, required this.text2, required this.text3 }) : super(key: key);
  final String? text1;
  final String? text2;
  final String? text3;
  @override
  State<ParentResults> createState() => _ParentResultsState();
}

class _ParentResultsState extends State<ParentResults> {

  var temp4 = 'Financial Analyst';
  var temp5 = <String>[];
  var lenth1;
  List<DropdownMenuItem> subdomains = [];
  List<String> subdomains1 = [];
  List<String> subdomains2 = [];
  List<String> tempsub = [];
  var blah,blah2;
  String temps="";
  List<String> subdomains3 = ["Loyola-ICAM College of Engineering and Technology","JSS Technological University","AIIMS","BITS","Madras Medical College","Jahwaharlal Nehru University","Miranda House","St.Stephen's College","St.John's Medical College, Bangalore","Lakshmibai College of Physical Education"];

  bool showSpinner = false;
  // var db = firebase.firestore();
  @override
  // var blah = text1;
  Widget build(BuildContext context) {
    blah = widget.text1;
    blah2 = widget.text2;
    print(widget.text1);
    print(widget.text2);
    print(widget.text3);
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      appBar: AppBar(backgroundColor: Color(0xff000000),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg1.png"),
            fit: BoxFit.cover,
          ),
        ),

        child:ModalProgressHUD(
          inAsyncCall: showSpinner,
          child:
                Center(
                  child:SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),

                        // Step 4 <-- SEE HERE
                        Text(
                          'Below are the colleges which you can choose for your ward in concern with all the parameters we got from you',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 5),
                Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: subdomains3.length,
                                        itemBuilder: (BuildContext context,int index){
                                          return Card(
                                            child: ListTile(
                                              //leading: Icon(Icons.music_note),
                                              title: Text('${subdomains3[index]}'),
                                            ),
                                            color: Colors.black54,
                                            elevation: 8,
                                            shadowColor: Colors.lightBlueAccent,
                                            margin: EdgeInsets.all(20),
                                          );
                                        }
                                    ),
                                    const SizedBox(height: 10),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),

                                    )
                                  ],
                                ),

                            ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
              ),),
      ),

    );
  }
  showDataAlert(arg1) {
    List<String> ug_courses = [];
    List<String> pg_courses = [];
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            backgroundColor: Colors.black54,
            title: Text(
              '$arg1',
              style: TextStyle(fontSize: 25.0),
            ),
            content: Container(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Colleges').where('name',isEqualTo: arg1)
                          .snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot3) {
                        var al = snapshot3.data!.docs[0].get("District").toString();
                        var bl = snapshot3.data!.docs[0].get("State").toString();
                        var el = snapshot3.data!.docs[0].get("category").toString();

                        if (!snapshot3.hasData) {
                          debugPrint('IT has data');
                          return CircularProgressIndicator();
                        }
                        return Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.all(8.0),
                                child: Card(

                                  child: ListTile(
                                    //leading: Icon(Icons.music_note),

                                    title: Text('District: ''$al'),
                                  ),
                                  color: Colors.black54,
                                  elevation: 8,
                                  shadowColor: Colors.lightBlueAccent,
                                  margin: EdgeInsets.only(top: 13.0,
                                      left: 20.0,
                                      bottom: 5.0,
                                      right: 20.0),
                                  // onTap: () {
                                  //   showAlertDialog(context);
                                  // },

                                ),
                              ),
                              // const SizedBox(height: 100),
                              // Expanded(child: SizedBox.shrink()),
                              Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.all(8.0),
                                child: Card(

                                  child: ListTile(
                                    //leading: Icon(Icons.music_note),

                                    title: Text('State: ''$bl'),
                                  ),
                                  color: Colors.black54,
                                  elevation: 8,
                                  shadowColor: Colors.lightBlueAccent,
                                  margin: EdgeInsets.only(top: 5.0,
                                      left: 20.0,
                                      bottom: 20.0,
                                      right: 20.0),
                                  // onTap: () {
                                  //   showAlertDialog(context);
                                  // },

                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.all(8.0),
                                child: Card(

                                  child: ListTile(
                                    //leading: Icon(Icons.music_note),

                                    title: Text('Category: ''$el'),
                                  ),
                                  color: Colors.black54,
                                  elevation: 8,
                                  shadowColor: Colors.lightBlueAccent,
                                  margin: EdgeInsets.only(top: 5.0,
                                      left: 20.0,
                                      bottom: 20.0,
                                      right: 20.0),
                                  // onTap: () {
                                  //   showAlertDialog(context);
                                  // },

                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 60,
                                padding: const EdgeInsets.all(8.0),
                                // margin: const EdgeInsets.only(top: 0.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent,
                                    // fixedSize: Size(250, 50),
                                  ),
                                  child: Text(
                                    "Close",
                                  ),
                                ),
                              ),


                            ],),);



                      },
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
  void _sendDataToFifthScreen(BuildContext context) {

  }


}

