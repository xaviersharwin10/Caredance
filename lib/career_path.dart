import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
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
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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

  // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

    const SizedBox(height: 3),
    Text(
    "Select your field of Interest",
    style: TextStyle(fontSize: 20.0),

    ),
    const SizedBox(height: 3),
    DropdownButton(

    // Initial Value
    value: temp,

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
    const SizedBox(height: 3),
    Text(
    "Grade",
    style: TextStyle(fontSize: 20.0),

    ),
    const SizedBox(height: 3),

    DropdownButton(

    // Initial Value
    value: dropdownvalue,
    // controller: dropdowncontroller,
    // Down Arrow Icon
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
    dropdownvalue = newValue!;
    });
    },
    ),
    const SizedBox(height: 3),

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
    }
          ,
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
  final String ?text1;

  // var temp4;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}
class _SecondScreenState extends State<SecondScreen> {
  var temp4;
  var temp5 = <String>[];
  // var db = firebase.firestore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Streams').where('sub-domain-of', isEqualTo: widget.text1).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      debugPrint('IT has data');
      // debugPrint(snapshot.data!.docs[0].get('sub-domains'));
    return Center(
    child: CircularProgressIndicator(),
    );

    }
    if (!snapshot.hasData) {
    temp4 = snapshot.data!.docs[0].get('sub-domains');
    // temp5 = snapshot.data!.get('sub-domains');
    // debugPrint('setDefault make: $temp4');
    }
    return Center(
    child: Column(
    children: [
    SizedBox(
    height: 50,
    ),
    // Step 4 <-- SEE HERE
    Text(
    '${widget.text1}',
    style: TextStyle(fontSize: 54),
    ),
    DropdownButton(

    // Initial Value
    value: temp4,

    // Down Arrow Icon
    icon: const Icon(Icons.keyboard_arrow_down),

    // Array list of items
    items: snapshot.data!.docs.map((value) {
    return DropdownMenuItem(

    value: value.get("sub-domains"),
    child: Text('${value.get("sub-domains")}'),
    );
    }).toList(),
    // After selecting the desired option,it will
    // change button value to selected value
    onChanged: (value) {
    setState(() {
    temp4 = value!;
    });
    },
    ),
    const SizedBox(height: 3),


    ],
    ),
    );
    }

      )
    );
  }
}