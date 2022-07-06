import 'dart:async';

import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiSplashScreen extends StatefulWidget {
  @override
  _BmiSplashScreen createState() => _BmiSplashScreen();
}

class _BmiSplashScreen extends State<BmiSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BmiDataScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  'assets/icon/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "KAFASAN",
              style: TextStyle(
                fontSize: 10,
                color: textLightColor,
              ),
            ),
            SizedBox(height: 10,)
          ], //<Widget>[]
        ),
      ),
    );
  }
}
