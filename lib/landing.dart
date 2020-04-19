import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  void redirectToHome() async {
      // The delay fixes it
      Future.delayed(Duration(milliseconds: 100)).then((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
  }

  @override
  void initState() {
    super.initState();
    print("object2");
    redirectToHome();
  }

  @override
  Widget build(BuildContext context) {
    print("object1");

    return SafeArea(
      child: Container(
        color: Colors.blueAccent,
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

