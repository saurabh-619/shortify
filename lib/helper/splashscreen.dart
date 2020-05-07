import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shortify/views/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFCBC35),
            ),
          ),
          Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/ani3.gif'),
                height: 400,
              ),
              Text(
                'Shortify',
                style: GoogleFonts.roboto(
                  color: Color(0xFF282B30),
                  fontSize: 50,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitChasingDots(
                color: Colors.greenAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
