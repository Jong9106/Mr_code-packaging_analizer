import 'package:deep_app_mr_code/Home.dart';
import 'package:deep_app_mr_code/Instructions.dart';
import 'package:deep_app_mr_code/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deep_app_mr_code/SignIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mr_code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) {
          if (_loggedIn) {
            return Instructions();
          } else {
            return Home();
          }
        },
      },
    );
  }
}
