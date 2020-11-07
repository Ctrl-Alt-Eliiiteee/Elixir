import 'package:flutter/material.dart';

class RegisterDonate extends StatefulWidget {
  @override
  _RegisterDonateState createState() => _RegisterDonateState();
}

class _RegisterDonateState extends State<RegisterDonate> {
  String firstname;
  String lastname;
  String bloodGrp;
  String phone;
  String bloodType = 'A+';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' Register',
                  style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 1.5,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      ' To',
                      style: TextStyle(
                        fontSize: 60,
                        letterSpacing: 1.5,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      ' Donate',
                      style: TextStyle(
                          fontSize: 60,
                          letterSpacing: 1.5,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                    child: TextField(
                      onChanged: ((value) {
                        firstname = value;
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                    child: TextField(
                      onChanged: ((value) {
                        lastname = value;
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Last Name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                    child: TextField(
                      onChanged: ((value) {
                        phone = value;
                      }),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select your Blood type',
                      style: TextStyle(fontSize: 20, letterSpacing: 1)),
                  SizedBox(
                    width: 30,
                  ),
                  Card(
                    elevation: 8,
                    child: Container(
                      height: 50,
                      width: 70,
                      child: Center(
                        child: DropdownButton<String>(
                          value: bloodType,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 8,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              bloodType = newValue;
                            });
                          },
                          items: <String>[
                            'A+',
                            'A-',
                            'AB+',
                            'AB-',
                            'B+',
                            'B-',
                            'O+',
                            'O-'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ButtonTheme(
                minWidth: 200,
                height: 50,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  elevation: 8,
                  child: Text("Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
