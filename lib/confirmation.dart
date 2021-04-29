import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  String description = "Thank you for your registration, remember that all your data is secure and will be treated according to the data processing policies.";

  @override
  Widget build(BuildContext context) {
    final registration = Container(
      color: Colors.white,
      child: new Text(
        description,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
        ),
        textAlign: TextAlign.center,



      ),
    );
    return registration;
  }
}