import 'package:deep_app_mr_code/Camera_photo.dart';
import 'package:deep_app_mr_code/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001C22),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          tooltip: 'package analizer',
          onPressed: null,
        ),
        title: Text(
          '<package analizer>',
          style: GoogleFonts.robotoCondensed(
            textStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: CardInstruction(),
    );
  }
}

class CardInstruction extends StatelessWidget {
  const CardInstruction({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.only(
        top: 200.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Card(
        shadowColor: Color(0xff005457),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                'Instructions',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff132C33),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 10,
                right: 10,
              ),
              child: Text(
                'Take a photo of the product or upload an image, the distribution company will be identified and assigned to a packaging category.',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff132C33),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 80, right: 80, bottom: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Photo()));
                }, //since this is only a UI app
                child: Text(
                  'ACEPTAR',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'SFUIDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Color(0xff005457),
                elevation: 10,
                minWidth: 400,
                height: 40,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
