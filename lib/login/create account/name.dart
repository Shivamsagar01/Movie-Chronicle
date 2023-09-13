import 'package:flutter/material.dart';
import 'package:spotify_clone/login/create%20account/selectArtists.dart';

import 'musicYouLike.dart';

class yourName extends StatefulWidget {
  @override
  _yourNameState createState() => _yourNameState();
}

class _yourNameState extends State<yourName> {
  var buttonColor = Colors.transparent;
  var borderColor = Colors.white;
  var buttonColor1 = Colors.transparent;
  var borderColor1 = Colors.white;

  TextEditingController _nametextEditingController = TextEditingController();
  bool _isNameTextFieldEmpty = true;
  Color _buttonTextColor = Colors.grey.shade800;
  Color _TextFieldColor = Colors.grey.shade50;

  void _checkNameTextFieldValue() {
    setState(() {
      _isNameTextFieldEmpty = _nametextEditingController.text.isEmpty;
      if (_isNameTextFieldEmpty) {
        _TextFieldColor = Colors.grey.shade50;
        _buttonTextColor = Colors.grey.shade800;
      } else {
        _TextFieldColor = Colors.grey.shade800;
        _buttonTextColor = Colors.black;
      }
    });
  }
  Widget? IconSelector(){
    if((buttonColor == Colors.transparent) )
    {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // buttonColor
          color: buttonColor,
          border: Border.all(
            // color: Colors.grey,
            color: borderColor,
            width: 1.0,
          ),
        ),
      );
    }
    else if((buttonColor == Colors.green))
    {
      return Icon(
        Icons.check_circle,
        color: buttonColor,
        size: 30,
      );
    }
  }
  Widget? IconSelector1(){
    if((buttonColor1 == Colors.transparent ) )
    {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // buttonColor
          color: buttonColor1,
          border: Border.all(
            // color: Colors.grey,
            color: borderColor1,
            width: 1.0,
          ),
        ),
      );
    }
    else if((buttonColor1 == Colors.green))
    {
      return Icon(
        Icons.check_circle,
        color: buttonColor1,
        size: 30,
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
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
                  SizedBox(height: 70,),
                  Text("What's your name?",style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: _nametextEditingController,
                      onChanged: (value) {
                        _checkNameTextFieldValue();
                      },
                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),
                      cursorColor:_TextFieldColor ,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: _TextFieldColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(color: Colors.transparent)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text("This appears on your Spotify profile.",style: TextStyle(color: Colors.white,fontSize: 13.5,),),
                  SizedBox(height: 10,),
                  Divider(color: Colors.grey,thickness: 1),
                  SizedBox(height: 15,),
                  Text("By tapping 'Create account', you agree to the Spotify Terms of use.",style: TextStyle(color: Colors.white,fontSize: 12.5,),),
                  SizedBox(height: 18,),
                  Text("Terms of Use",style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.w800),),
                  SizedBox(height: 18,),
                  Text("To learn more about how Spotify collects, uses, shares and protect your personal data, please see the Spotify Privacy Policy.",style: TextStyle(color: Colors.white,fontSize: 12.5,),),
                  SizedBox(height: 18,),
                  Text("Privacy Policy",style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.w800),),
                  SizedBox(height: 22,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width:  MediaQuery.of(context).size.width - 50,
                          child: Text("I would prefer not to receive marketing messages from Spotify.",style: TextStyle(color: Colors.white,fontSize: 12.5,),)),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(buttonColor == Colors.transparent)
                            {
                              buttonColor = Colors.green;
                              borderColor = Colors.green;
                            }
                            else if(buttonColor == Colors.green)
                            {
                              buttonColor = Colors.transparent;
                              borderColor = Colors.white;
                            }
                          });
                        },
                        child: IconSelector(),
                      )
                    ],
                  ),
                  SizedBox(height: 22,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width:  MediaQuery.of(context).size.width - 50,
                          child: Text("Share my registration data to with Spotify's content providers for marketing purposes.",style: TextStyle(color: Colors.white,fontSize: 12.5,),)),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(buttonColor1 == Colors.transparent)
                            {
                              buttonColor1 = Colors.green;
                              borderColor1 = Colors.green;
                            }
                            else if(buttonColor1 == Colors.green)
                            {
                              buttonColor1 = Colors.transparent;
                              borderColor1 = Colors.white;
                            }
                          });

                        },
                        child: IconSelector1(),

                      )
                    ],
                  ),
                  SizedBox(height: 180,),
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (Context)=> MusicLangSelection()));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey.shade700;
                              } else {
                                return Colors.white;
                              }
                            },
                          ),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        child: Text(
                          'Create account',
                          style: TextStyle(
                            fontSize: 17,
                            color: _buttonTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22,),
                  Center(child: Text("PROTECTED BY RECAPTCHA",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

