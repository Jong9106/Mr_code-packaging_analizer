import 'package:deep_app_mr_code/Instructions.dart';
import 'package:deep_app_mr_code/SignIn.dart';
import 'package:deep_app_mr_code/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            width: 200.0,
            padding: const EdgeInsets.only(
              top: 200.0,
            ),
            child: Image(image: AssetImage('Assets/boxIcon.png')),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0
            ),
            child: Text('<package analizer>',
              style: GoogleFonts.robotoCondensed(
                textStyle: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff132C33),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 20, left: 120, right: 120),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Instructions())
                );
              },//since this is only a UI app
              child: Text('CONTINUE',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Color(0xff005457),
              elevation: 10,
              minWidth: 400,
              height: 50,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
