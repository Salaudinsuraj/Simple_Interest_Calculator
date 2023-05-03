import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text("Space Jet",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Raleway",
                          decoration: TextDecoration.none,
                          color: Colors.white)
                  ),
                ),

                Expanded(
                  child:  Text("From Lagos to Calabar via Pendulum airways,"
                      " the fastest and reliable",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Raleway",
                          decoration: TextDecoration.none,
                          color: Colors.white)
                  ),
                )

              ],
            ),
            SizedBox(height: 30),
            FlightImageAsset(),
            SizedBox(height: 30),
            FlightBookButton(),
          ],
        )
      ),
    );
  }

}

class FlightImageAsset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("assets/images/plane.jpg");
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}


class FlightBookButton extends StatelessWidget {
  const FlightBookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.redAccent,
        elevation: 6.5,
      ),
      child: Text("Book your flight",
        style: TextStyle(fontSize: 20.0),
      ),
        onPressed: () {
          bookFlight(context);
        },
      );

  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Flight Booked Succesfully"),
      content: Text("Enjoy your trip"),
    );
    
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        }
    );
  }
    }




