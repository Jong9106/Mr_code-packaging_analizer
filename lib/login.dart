import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  final Function onLoginSuccess;

  const LogIn({Key key, this.onLoginSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Entrar'),
          onPressed: () {
            onLoginSuccess();
          },
        ),
      ),
    );
  }
}
