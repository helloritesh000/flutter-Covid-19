import 'package:covid19world/district-list.dart';
import 'package:covid19world/home.dart';
import 'package:covid19world/landing.dart';
import 'package:covid19world/resources.dart';
import 'package:covid19world/state-list.dart';
import 'package:flutter/material.dart';



void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/": (context) => LandingPage(),
    "/home": (context) => HomePage(),
    "/state": (context) => StateListPage(),
    "/district": (context) => DistrictListPage(),
    "/resource": (context) => ResourceListPage(),
  },
));

