import 'nav_bar.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: deprecated_member_use
final _firestore = Firestore.instance;

class Stream extends StatefulWidget {
  @override
  _StreamState createState() => _StreamState();
}

class _StreamState extends State<Stream> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Center(child: Text('List of Donors')),
        leading: null,
        backgroundColor: Colors.green[600],
      ),
      body: SafeArea(
        child: Acceptor()
      ),
    );
  }
}

class Acceptor extends StatefulWidget {
  @override
  _AcceptorState createState() => _AcceptorState();
}

class _AcceptorState extends State<Acceptor> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('D_A')
          .orderBy('time', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          );
        }
        // ignore: deprecated_member_use
        final cards = snapshot.data.documents.reversed;
        List<DonorCards> donorCards = [];
        for (var card in cards) {
          final name = card.data()['First Name']+" "+card.data()['Last Name'];
          final phone = card.data()['Phone'];
          final bloodgrp = card.data()['Blood Type'];

          final donorCard = DonorCards(
            name: name,
            phone: phone,
            bloodgrp: bloodgrp,
          );

          donorCards.add(donorCard);
        }
        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                children: donorCards,
              ),
            ),
          ],
        );
      },
    );
  }
}

class DonorCards extends StatefulWidget {
  DonorCards({this.name, this.phone, this.bloodgrp});

  String name;
  String phone;
  String bloodgrp;

  @override
  _DonorCardsState createState() => _DonorCardsState();
}

class _DonorCardsState extends State<DonorCards> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Card(
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                      width: 2,
                        color: Colors.green
                    )
                ),
            ),
            child: ListTile(
              title: Text(widget.name+" ("+widget.bloodgrp+")"),
              subtitle: Text(widget.phone),
            ),
          ),
        ),
      ),
    );
  }
}