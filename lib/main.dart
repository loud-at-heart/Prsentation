import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextSample(),
    );
  }
}

class TextSample extends StatefulWidget {
  const TextSample({Key? key}) : super(key: key);

  @override
  _TextSampleState createState() => _TextSampleState();
}

class _TextSampleState extends State<TextSample> {
  String text = "Welcome to MoneyTap";
  int a =2;
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.favorite),
      ),
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){print(text); },
            child: Text(
              text,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text',
                hintText: 'Enter Your Text',
              ),
              // onChanged: (value){
              //   setState(() {
              //     text = value;
              //   });
              // },
              onSubmitted: (value){
                setState(() {
                  text = value;
                });
              },
            ),
          ),
          RaisedButton(onPressed: (){
            setState(() {
              text = myController.text;
            });
          },child: Text('Show Text'),)
        ],
      )),
    );
  }
}
