import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Career_Path());
}

class Career_Path extends StatelessWidget {
  const Career_Path({Key? key}) : super(key: key);
  static const String _title = 'Enter Your Details!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: _title,
      home: Scaffold(
        body: const GradeScreen(),
      ),
    );
  }
}
class GradeScreen extends StatefulWidget {
  const GradeScreen({Key? key}) : super(key: key);

  @override
  State<GradeScreen> createState() => _GradeScreen();
}

class _GradeScreen extends State<GradeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownvalue = '10';
  var temp, temp2;
  var grades = [
    '9',
    '10',
    '11',
    '12',
  ];

  var temps = [
    'Software Engineering',
    'Mechanical Engineering',
    'Finance',
    'Human Resources',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/images/bulb.png"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5),
                    blurRadius: 50,
                    color: Colors.lightBlueAccent.withOpacity(0.23),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40.0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Subjects').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        const SizedBox(height: 20),
                        Text(
                          "Which Grade are you?",
                          style: TextStyle(fontSize: 23.0),
                        ),
                        const SizedBox(height: 10),
                        DropdownButton(
                          // Initial Value
                          value: dropdownvalue,
                          // controller: dropdowncontroller,
                          // Down Arrow Icon
                          dropdownColor: const Color(0xff004AAD),
                          icon: const Icon(Icons.keyboard_arrow_down),


                          // Array list of items
                          items: grades.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              temp = newValue!;
                              if(temp=='11'||temp=='12'){
                                _sendDataToNormalFlow(context);
                              }
                              else {
                                _sendDataToMyStatefulWidget2(context);
                              }});
                          },
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _sendDataToNormalFlow(BuildContext context){
    // String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyStatefulWidget3(text1: temp),
        ));
    // );
  }
  void _sendDataToMyStatefulWidget2(BuildContext context) {
    // String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyStatefulWidget2(text1: temp),
        ));
    // );
  }
}


class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({Key? key,required this.text1}) : super(key: key);
  final String? text1;

  @override
  State<MyStatefulWidget2> createState() => _MyStatefulWidgetState2();
}

class _MyStatefulWidgetState2 extends State<MyStatefulWidget2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownvalue = '6';
  var temp, temp2;
  var grades = [
    '9',
    '10',
    '11',
    '12',
  ];

  var temps = [
    'Software Engineering',
    'Mechanical Engineering',
    'Finance',
    'Human Resources',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/images/bulb.png"),
                  fit: BoxFit.cover,
                ),

                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5),
                    blurRadius: 50,
                    color: Colors.lightBlueAccent.withOpacity(0.23),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40.0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Subjects').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    temp = snapshot.data!.docs[0].id;
                    // debugPrint('setDefault make: $temp');
                  }
                print(widget.text1);
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        Text(
                          "Choose your favorite subject",
                          style: TextStyle(fontSize: 23.0),
                        ),
                        const SizedBox(height: 10),
                        DropdownButton(
                          // Initial Value
                          value: temp,
                          dropdownColor: const Color(0xff004AAD),
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: snapshot.data!.docs.map((value) {
                            return DropdownMenuItem(
                              value: value.id,
                              child: Text('${value.id}'),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (value) {
                            setState(() {
                              temp = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                                _sendDataToMyStatefulWidget1(context);
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendDataToMyStatefulWidget1(BuildContext context) {
    // String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyStatefulWidget1(text1: temp),
        ));
    // );
  }
}

class MyStatefulWidget1 extends StatefulWidget {
  const MyStatefulWidget1({Key? key,required this.text1}) : super(key: key);
  final String? text1;
  @override
  State<MyStatefulWidget1> createState() => _MyStatefulWidgetState1();
}

class _MyStatefulWidgetState1 extends State<MyStatefulWidget1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownvalue = '6';
  var temp, temp2;
  var lenth1;
  List<DropdownMenuItem> subdomains = [];
  List<String> subdomains1 = [];
  var grades = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  var temp4;
  var temps = [
    'Software Engineering',
    'Mechanical Engineering',
    'Finance',
    'Human Resources',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/images/bulb.png"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5),
                    blurRadius: 50,
                    color: Colors.lightBlueAccent.withOpacity(0.23),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40.0),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Subjects')
                      .where('name', isEqualTo: widget.text1)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    DocumentSnapshot snap = snapshot.data!.docs[0];
                    lenth1 = snap.get("sub-subjects").length;
                    print(lenth1);
                    for (var i = 0; i < lenth1; i++) {
                      subdomains1.add(snap.get("sub-subjects")[i].toString());
                    }
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }


                    temp = snapshot.data!.docs[0].get("sub-subjects")[0].toString();
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Select your field of interest",
                            style: TextStyle(fontSize: 22.0,color: Colors.blue),textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // Step 4 <-- SEE HERE
                          Text(
                            '${widget.text1}',
                            style: TextStyle(fontSize: 25),textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),


                          DropdownButton<String>(
                              dropdownColor: const Color(0xff004AAD),
                              value: temp,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: subdomains1
                                  .map((value){
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text('${value}'),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                temp = value!;
                                temp4 = value!;
                                _sendDataToSecondScreen(context);

                              }
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    // String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text1: temp),
        ));
    // );
  }
}
class MyStatefulWidget3 extends StatefulWidget {
  const MyStatefulWidget3({Key? key,required this.text1}) : super(key: key);
  final String? text1;
  @override
  State<MyStatefulWidget3> createState() => _MyStatefulWidgetState3();
}

class _MyStatefulWidgetState3 extends State<MyStatefulWidget3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // List<String> _accountType=<String>[
  //   'Savings',
  //   'Deposit',
  //   'Checking',
  //   'Brokerage'
  // ];
  String dropdownvalue = '6';
  var temp, temp2;
  // var collection = FirebaseFirestore.instance.collection('Streams');
  // var docSnapshot = await collection.doc('doc_id').get();
  var grades = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];

  var temps = [
    'Software Engineering',
    'Mechanical Engineering',
    'Finance',
    'Human Resources',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Streams').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              temp = snapshot.data!.docs[0].id;
              // debugPrint('setDefault make: $temp');
            }

            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Text(
                    "Select your field of Interest",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  const SizedBox(height: 3),
                  DropdownButton(
                    // Initial Value
                    value: temp,
                    dropdownColor: const Color(0xff004AAD),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: snapshot.data!.docs.map((value) {
                      return DropdownMenuItem(
                        value: value.id,
                        child: Text('${value.id}'),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (value) {
                      setState(() {
                        temp = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 5),

                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                          _sendDataToSecondScreen(context);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _sendDataToSecondScreen(BuildContext context) {
    // String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text1: temp),
        ));
    // );
  }
}
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.text1}) : super(key: key);
  final String? text1;

  // var temp4;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  var temp4='Software Engineering';
  var temp;
  var temp5 = <String>[];
  var lenth1;
  List<DropdownMenuItem> subdomains = [];
  List<String> subdomains1 = [];
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF000000),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/bulb1.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,5),
                      blurRadius: 50,
                      color: Colors.lightBlueAccent.withOpacity(0.23),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(40.0),
                child:ModalProgressHUD(
                  inAsyncCall: showSpinner,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Streams')
                          .where('sub-domain-of', isEqualTo: widget.text1)
                          .snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        DocumentSnapshot snap = snapshot.data!.docs[0];
                        lenth1 = snap.get("sub-domains").length;
                        print(lenth1);
                        for (var i = 0; i < lenth1; i++) {
                          subdomains1.add(snap.get("sub-domains")[i].toString());
                        }
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }


                        temp = snapshot.data!.docs[0].get("sub-domains")[0].toString();




                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Here are the domains that match your field of interest",
                                style: TextStyle(fontSize: 22.0,color: Colors.blue),textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              // Step 4 <-- SEE HERE
                              Text(
                                '${widget.text1}',
                                style: TextStyle(fontSize: 25),textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),


                              DropdownButton<String>(
                                  dropdownColor: const Color(0xff004AAD),
                                  value: temp,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: subdomains1
                                      .map((value){
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text('${value}'),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    temp = value!;
                                    temp4 = value!;
                                    _sendDataToThirdScreen(context);

                                  }
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        );
                      }),),
              ),]
        ),
      ),
    );
  }
  void _sendDataToThirdScreen(BuildContext context) {
    // String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThirdScreen(text1: temp4),
        ));
    // );
  }
}



class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.text1}) : super(key: key);
  final String? text1;

  // var temp4;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  var temp4 = 'Financial Analyst';
  var temp;
  var temp5 = <String>[];
  var lenth1;
  bool showSpinner = false;
  List<DropdownMenuItem> subdomains = [];
  List<String> subdomains1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF000000),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/bulb2.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,5),
                      blurRadius: 50,
                      color: Colors.lightBlueAccent.withOpacity(0.23),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(40.0),

                child:ModalProgressHUD(
                  inAsyncCall: showSpinner,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('profession').where('jobs-of',isEqualTo: widget.text1)
                          .snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        DocumentSnapshot snap = snapshot.data!.docs[0];
                        lenth1 = snap
                            .get("jobs")
                            .length;
                        print(lenth1);
                        for (var i = 0; i < lenth1; i++) {
                          subdomains1.add(snap.get("jobs")[i].toString());
                        }
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // if (!snapshot.hasData) {
                        temp = snapshot.data!.docs[0].get("jobs")[0].toString();
                        // }

                        return Center(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Here are the professions that match your domain",
                                style: TextStyle(fontSize: 22.0,color: Colors.blue),textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                '${widget.text1}',
                                style: TextStyle(fontSize: 25),textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              DropdownButton<String>(
                                  value: temp,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  dropdownColor: const Color(0xff004AAD),
                                  items: subdomains1.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text('${value}'),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    temp = newValue;
                                    temp4 = newValue!;
                                    _sendDataToFourthScreen(context);
                                  }
                              ),

                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      }),),
              ),]
        ),
      ),
    );
  }

  void _sendDataToFourthScreen(BuildContext context) {
    // String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FourthScreen(text1: temp4,text2: widget.text1),
        ));
    // );
  }
}


class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key, required this.text1, required this.text2 }) : super(key: key);
  final String? text1;
  final String? text2;

  // var temp4;

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {

  var temp4 = 'Financial Analyst';
  var temp5 = <String>[];
  var lenth1;
  List<DropdownMenuItem> subdomains = [];
  List<String> subdomains1 = [];
  List<String> subdomains2 = [];
  List<String> tempsub = [];
  var blah,blah2;
  String temps="";
  bool showSpinner = false;
  // var db = firebase.firestore();
  @override
  // var blah = text1;
  Widget build(BuildContext context) {
    blah = widget.text1;
    blah2 = widget.text2;
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      appBar: AppBar(backgroundColor: Color(0xff000000),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bluebg1.png"),
            fit: BoxFit.cover,
          ),
        ),

        child:ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('courses').where("career_options", arrayContains: blah2)
                  .snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                DocumentSnapshot snap = snapshot.data!.docs[0];
                var lenth = snap
                    .get("career_options")
                    .length;
                print(lenth);

                var i=0;
                while(i<snapshot.data!.docs.length){
                  subdomains2.add(snapshot.data!.docs[i].id.toString());
                  i++;
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child:SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),

                        // Step 4 <-- SEE HERE
                        Text(
                          'You have chosen to become a ${blah}',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(height: 5),

                        Text(
                          'You can take the below courses to reach your goal of becoming a ${blah}',
                          style: TextStyle(fontSize: 16,color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Colleges').where('ug_courses',arrayContainsAny: subdomains2)
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot2) {
                              var j=0;
                              while(j<snapshot2.data!.docs.length){
                                subdomains1.add(snapshot2.data!.docs[j].id.toString());
                                j++;
                              }

                              if (!snapshot.hasData) {
                                debugPrint('IT has data');

                                // debugPrint(snapshot.data!.docs[0].get('sub-domains'));
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              return Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: subdomains2.length,
                                        itemBuilder: (BuildContext context,int index){
                                          return Card(
                                            child: ListTile(
                                              //leading: Icon(Icons.music_note),
                                              title: Text('${subdomains2[index]}'),
                                            ),
                                            color: Colors.black54,
                                            elevation: 8,
                                            shadowColor: Colors.lightBlueAccent,
                                            margin: EdgeInsets.all(20),
                                          );
                                        }
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Below are the top rated colleges which offer those courses',
                                      style: TextStyle(fontSize: 16, color: Colors.blue),
                                      textAlign: TextAlign.center,
                                    ),

                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: subdomains1.length,
                                        itemBuilder: (BuildContext context,int index){

                                          return GestureDetector(
                                            onTap: () {
                                              showDataAlert(subdomains1[index]);
                                            },

                                            child:Card(

                                              child: ListTile(
                                                //leading: Icon(Icons.music_note),

                                                title: Text('${subdomains1[index]}'),
                                              ),
                                              color: Colors.black54,
                                              elevation: 8,
                                              shadowColor: Colors.lightBlueAccent,
                                              margin: EdgeInsets.all(20),
                                              // onTap: () {
                                              //   showAlertDialog(context);
                                              // },

                                            ),);
                                        }
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),

                                    )
                                  ],
                                ),
                              );
                            }),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),);
              }),),
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
