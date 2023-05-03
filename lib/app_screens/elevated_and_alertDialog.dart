import 'package:flutter/material.dart';
import 'app_screens/first_screen.dart';

void main() => runApp(HomePage());



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My Flutter App Screen",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("My First App Screen"),),
          body: FirstScreen(),
        )
    );
  }
}
