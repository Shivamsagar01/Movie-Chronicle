import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'login with phone animation.dart';

class myLoginSignupPage extends StatefulWidget {
  @override
  State<myLoginSignupPage> createState() => _myLoginSignupPageState();
}

class _myLoginSignupPageState extends State<myLoginSignupPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back,color: Colors.white,size: 30)),
                  SizedBox(height: 35),
                  Text(
                    'Enter phone number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedTextMove()
                ]),
          ),
        ),
      ),
    );
  }
}
