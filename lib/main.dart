import 'package:flutter/material.dart';
import 'package:project_one/main.dart';
import 'app_screens/first_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Interest Machine",
    debugShowCheckedModeBanner: false,
    home: SIForm(),
    theme: ThemeData(
      primaryColor: Colors.yellow,
      // brightness: Brightness.dark
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<SIForm> createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var formKey = GlobalKey<FormState>();
  var currencies = ["Rupees", "Dollars", "Pounds"];
  var currentItemSelected = "Rupees";
  final _minimumPadding = 5.0;
  TextEditingController principalControlled = TextEditingController();
  TextEditingController roiControlled = TextEditingController();
  TextEditingController termControlled = TextEditingController();

  var displayResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator "),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: <Widget>[
                getImageAsset(),
                Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                    validator:(value){
                      if(value!.isEmpty) {
                        return "Please enter a value";
                      }
                      return null;
                    } ,
                    controller: principalControlled,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Enter Principal e.g 12,000",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextField(
                    controller: roiControlled,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Rate of interest",
                      hintText: "In percent ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: termControlled,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Terms",
                          hintText: "Enter Principal e.g 12,000",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      items: currencies.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: currentItemSelected,
                      onChanged: (newValueSelected) {
                        onDropDownItemSelected(newValueSelected);
                      },
                    )),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding * 5, bottom: _minimumPadding * 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text("Calculate"),
                            onPressed: () {
                              setState(() {
                                if (formKey.currentState!.validate()){
                                   displayResult = calculateTotalReturns();
                                }
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text("Reset"),
                            onPressed: () {
                              setState(() {
                                reset();
                              });
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minimumPadding),
                  child: Text(displayResult),
                )
              ],
            ),
          )),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("assets/images/money.jpg");
    Image image = Image(image: assetImage, width: 100, height: 120);
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 5),
    );
  }

  void onDropDownItemSelected(newValueSelected) {
    setState(() {
      currentItemSelected = newValueSelected;
    });
  }

  String calculateTotalReturns() {
    double principal = double.parse(principalControlled.text);
    double roi = double.parse(roiControlled.text);
    double term = double.parse(termControlled.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result =
        "After $term years, your investment will be worth $totalAmountPayable"
        " $currentItemSelected";
    return result;
  }

  void reset() {
    principalControlled.text = "";
    roiControlled.text = "";
    termControlled.text = "";
    displayResult = "";
    currentItemSelected = currencies[0];
  }
}
