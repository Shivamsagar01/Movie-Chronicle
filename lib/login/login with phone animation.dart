import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'create account/myCountryPicker.dart';
import 'otp screen.dart';


class AnimatedTextMove extends StatefulWidget {
  static String verify = "";
  @override
  _AnimatedTextMoveState createState() => _AnimatedTextMoveState();
}

class _AnimatedTextMoveState extends State<AnimatedTextMove> with SingleTickerProviderStateMixin {

  double _opacity = 0.0;
  myCountry? selectedCountry;
  TextEditingController _textEditingController = TextEditingController();
  bool _isTextFieldEmpty = true;
  Color _buttonTextColor = Colors.grey.shade800;
  Color _TextColor = Colors.grey.shade400;
  String otpCountryCode = '+91';

  late AnimationController _controller;
  late Animation<Offset> _animation;
  double _textTopOffset = 0.0;

  void _checkTextFieldValue() {
    setState(() {
      _isTextFieldEmpty = _textEditingController.text.isEmpty;
      if (_isTextFieldEmpty) {
        _TextColor = Colors.grey.shade400;
        _buttonTextColor = Colors.grey.shade800;
      } else {
        _TextColor = Colors.white;
        _buttonTextColor = Colors.black;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(-1, -0.13),
      end: Offset(-1, 1 / MediaQuery.of(context).size.height),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 470), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    onTap: () async {
                      selectedCountry = await Navigator.push(context, MaterialPageRoute(builder: (Context)=> CountryCodePicker()));
                      setState(() {

                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectedCountry != null
                            ? Text(
                          '${selectedCountry?.name}',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                            : Text(
                          'India',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Icon(
                          LineIcons.angleRight,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey.shade100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5)),
                    ),
                    child: Center(
                        child: InkWell(
                          onTap: () async {
                            selectedCountry = await Navigator.push(context, MaterialPageRoute(builder: (Context)=> CountryCodePicker()));
                            setState(() {

                            });

                          },
                          child:selectedCountry != null
                              ? Text(
                            '${selectedCountry?.code}',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                              : Text(
                            '+91',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        )),
                  ),
                  Container(
                    height: 45,
                    width: 0.5,
                    color: Colors.grey.shade100,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width - 90.5,
                    child: TextField(
                      keyboardType:TextInputType.number ,
                      controller: _textEditingController,
                      onChanged: (value) {
                        _checkTextFieldValue();
                      },
                      // cursorColor: Colors.grey.shade400,
                        cursorColor: _TextColor,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        contentPadding:
                        EdgeInsets.only(left: 15, top: 16),
                        filled: true,
                        fillColor: Colors.grey.shade700,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Container(
                alignment: Alignment.topCenter,
                child: Transform.translate(
                  offset: Offset(0, _animation.value.dy * MediaQuery.of(context).size.height),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "We'll send you a code by SMS to confirm your phone number.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "We may occasionally send you service-based messages.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // print(_textEditingController.text.isEmpty),
                      Center(

                        child: SizedBox(
                          width: 100,
                          height: 50,
                          child: ElevatedButton(

                            onPressed: _isTextFieldEmpty ? null : () async {

                              selectedCountry != null
                                  ? otpCountryCode = selectedCountry!.code.toString()
                                  : otpCountryCode = '+91';

                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '${otpCountryCode + _textEditingController.text.toString()}',
                                verificationCompleted: (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {},
                                codeSent: (String verificationId, int? resendToken) {
                                  AnimatedTextMove.verify = verificationId;
                                  Navigator.push(context, MaterialPageRoute(builder: (Context)=> otp_screen(_textEditingController.text.toString(),otpCountryCode)));
                                },
                                codeAutoRetrievalTimeout: (String verificationId) {},
                              );


                             // Navigator.push(context, MaterialPageRoute(builder: (Context)=> otp_screen(_textEditingController.text.toString(),otpCountryCode)));
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
                              'Next',
                              style: TextStyle(
                                fontSize: 17,
                                color: _buttonTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

      ],
    );
  }
}
