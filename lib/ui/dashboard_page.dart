import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:semux_mobile_wallet/global/constant.dart';
import 'package:semux_mobile_wallet/utils/key_generatior.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  KeyGenerator keyGenerator = KeyGenerator();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semux'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Create New Addres"),
              onPressed: () {
                generateNewPaire();
              },
            ),
            FlatButton(
              child: Text("Restor Addres from Privet Key"),
              onPressed: () {
                keyGenerator.testRestoreFromPrivetKey();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> generateNewPaire() async {
    keyGenerator.testNewPair();
  }
}
