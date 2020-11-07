import 'package:flutter/material.dart';

class AcceptBlood extends StatefulWidget {
  @override
  _AcceptBloodState createState() => _AcceptBloodState();
}

class _AcceptBloodState extends State<AcceptBlood> {
  String _email = 'sohamsakaria@gmail.com';
  String _firstname = 'Soham';
  String _lastname = 'Sakaria';
  String _phone = '999999999';
  String _blood = 'B+';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Donors"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          DonorCard(
              email: _email,
              name: (_firstname + ' ' + _lastname),
              phone: _phone,
              blood: _blood),
        ],
      ),
    );
  }
}

class DonorCard extends StatefulWidget {
  final String email;
  final String name;
  final String phone;
  final String blood;

  const DonorCard({Key key, this.email, this.name, this.phone, this.blood})
      : super(key: key);
  @override
  _DonorCardState createState() => _DonorCardState();
}

class _DonorCardState extends State<DonorCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width - 20,
        child: RaisedButton(
          onPressed: () {},
          color: Colors.white,
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 0, top: 0),
                height: 120,
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: " + widget.name,
                        style: TextStyle(fontSize: 20)),
                    Text("Email: " + widget.email,
                        style: TextStyle(fontSize: 20)),
                    Text("Phone: " + widget.phone,
                        style: TextStyle(fontSize: 20)),
                    Text("Blood group: " + widget.blood,
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
