import 'package:flutter/material.dart';
import 'app_screens/first_screen.dart';

void main() => runApp( MyFlutterApp());


class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "First Flutter App",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("My First App Screen1"),
          ),
          body: FirstScreen(),
        ),
    );
  }
    }

