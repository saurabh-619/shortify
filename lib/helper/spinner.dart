import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF282B30),
      child: Center(
        child: SpinKitRotatingCircle(
          color: Color(0xffFCBC35),
          size: 50.0,
        ),
      ),
    );
  }
}
