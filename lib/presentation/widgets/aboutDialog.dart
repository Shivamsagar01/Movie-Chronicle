import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ShowMyDialog extends StatelessWidget {
  const ShowMyDialog({
    Key? key,
    required this. title,
    required this.description,
    required this. buttonText,
    this.image
  }) : super(key: key);
  final String title, description, buttonText;
  final Widget? image;
  @override
  build(BuildContext context) {
    return Dialog(
      backgroundColor:Colors.black87,
      insetPadding: EdgeInsets.all(8),
      child: Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(title,style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description,style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.blue,
                  //     Colors.white,
                  //   ],
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  //
                  // ),
                  color: Colors.red,
                ),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    child:Center(child: Text(buttonText,style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.white),)) ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
