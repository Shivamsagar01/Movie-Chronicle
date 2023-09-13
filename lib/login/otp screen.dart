import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pinput/pinput.dart';

import 'create account/date of birth.dart';
import 'login with phone animation.dart';

class otp_screen extends StatefulWidget {
  var mobNo;
  var countryCode;
  otp_screen(this.mobNo, this.countryCode);
  @override
  State<otp_screen> createState() => _otp_screen();
}

class _otp_screen extends State<otp_screen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _textEditingController = TextEditingController();
  bool _isTextFieldEmpty = true;
  Color _buttonTextColor = Colors.grey.shade800;
  Color _TextColor = Colors.grey.shade400;

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
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      // padding: EdgeInsets.all(),
      margin: EdgeInsets.all(4),
      width: 34,
      height: 50,
      textStyle: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
          color: Color.fromRGBO(66, 66, 66, 0.8),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.grey.shade700,
      borderRadius: BorderRadius.circular(4),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
              SizedBox(height: 30,),
              Text(
                'Enter your code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Pinput(
                  controller: _textEditingController,
                  onChanged: (value){
                    _checkTextFieldValue();

                  },
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: false,
                  // onCompleted: (pin) => print(pin),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "We sent an SMS with a 6-digit code to",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  "${widget.countryCode}${widget.mobNo}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isTextFieldEmpty ? null : () async {
                      try{
                        // Create a PhoneAuthCredential with the code
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: AnimatedTextMove.verify, smsCode: _textEditingController.text);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        Navigator.push(context, MaterialPageRoute(builder: (Context)=> DateOfBirthSelector()));
                      }catch(e){
                        print("Wrong otp");

                      }

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
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/msgIcon.png',
                      height: 35,
                      width: 35,
                    ),
                    SizedBox(width: 2,),
                    Text('Resend SMS',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/editPenIcon.png',
                      height: 26,
                      width: 26,
                    ),
                    SizedBox(width: 5,),
                    Text('Edit phone number',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
