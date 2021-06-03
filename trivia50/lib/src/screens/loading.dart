import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFoldingCube(
                color: Colors.lightGreen,
              ),
              SizedBox(height: 50),
              SpinKitThreeBounce(
                color: Colors.lightGreen,
              )
            ],
          ),
        ));
  }
}
