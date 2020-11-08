import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'donateRegister.dart';
import 'Accept.dart';
import 'package:hexcolor/hexcolor.dart';
/*
donateRegister.dart - for Registering to donate
Accept.dart - for Displaying the donors
*/

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    List cards = [
      RaisedButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        elevation: 8,
        color: HexColor('#42C847'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterDonate()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/BloodDonate.png'),
                  fit: BoxFit.cover)),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      RaisedButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        elevation: 8,
        color: HexColor('#42C847'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Stream()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/AcceptBlood.png'),
                  fit: BoxFit.cover)),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 5,
        title: Text('Donate/Accept',
            style: TextStyle(fontSize: 25, letterSpacing: 1.4)),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: CarouselSlider(
          options: CarouselOptions(
              initialPage: 0,
              height: MediaQuery.of(context).size.height - 200,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.bounceIn),
          items: cards.map((card) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: card,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
