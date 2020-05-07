import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      // color: Colors.pink,
      color: Color(0xaaFCBC35),
      size: 50.0,
    );
  }
}
