import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'donateRegister.dart';
import 'Accept.dart';

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
      FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterDonate()),
          );
        },
        child: Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            height: MediaQuery.of(context).size.height-100,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("Donate",
                  style: TextStyle(
                      fontSize: 50, letterSpacing: 1.4, color: Colors.green)),
            )),
      ),
      FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Stream()),
          );
        },
        child: Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("Accept",
                  style: TextStyle(
                      fontSize: 50, letterSpacing: 1.4, color: Colors.green)),
            )),
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
      body:Align(
        alignment: Alignment.topCenter,
        child: CarouselSlider(
          options: CarouselOptions(
              initialPage: 0,
              height: MediaQuery.of(context).size.height-200,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.bounceIn),
          items: cards.map((card) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        elevation: 8,
                        child: card,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
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
