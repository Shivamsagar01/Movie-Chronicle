import 'package:flutter/material.dart';

import 'name.dart';


class genderSelector extends StatefulWidget {
  @override
  _genderSelectorState createState() => _genderSelectorState();
}

class _genderSelectorState extends State<genderSelector> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                    SizedBox(width: 80,),
                    Text('Create account',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 75,),
                Text("What's your gender?",style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: 35,),
                Row(
                  children: [
                    SizedBox(
                      width: 85,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (Context)=> yourName()));},
                        child: Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              width: 2.0, color: Colors.grey.shade700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    SizedBox(
                      width: 70,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (Context)=> yourName()));},
                        child: Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              width: 2.0, color: Colors.grey.shade700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    SizedBox(
                      width: 110,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (Context)=> yourName()));},
                        child: Text(
                          'Non-binary',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              width: 2.0, color: Colors.grey.shade700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    SizedBox(
                      width: 75,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (Context)=> yourName()));},
                        child: Text(
                          'Other',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              width: 2.0, color: Colors.grey.shade700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    SizedBox(
                      width: 145,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (Context)=> yourName()));},
                        child: Text(
                          'Prefer not to say',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(
                              width: 2.0, color: Colors.grey.shade700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

