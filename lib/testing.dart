import 'dart:io';

import 'package:covid19world/Dto/daily-update.dart';
import 'package:covid19world/services/covid-service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TestingList extends StatefulWidget {
  @override
  _TestingListState createState() => _TestingListState();
}

class _TestingListState extends State<TestingList> {
  List<Tested> testingWiseData = [];
  CovidIndiaService _covidIndiaService = CovidIndiaService();
  void populateData() async {
    if (testingWiseData.isEmpty) {
      testingWiseData = await _covidIndiaService.getTestingWiseUpdate();
      testingWiseData.sort((a, b) =>
          DateFormat("dd/MM/yyyy HH:mm:ss")
              .parse(b.updatetimestamp)
              .compareTo(
              DateFormat("dd/MM/yyyy HH:mm:ss").parse(a.updatetimestamp)));
      if(mounted) {
        setState(() {
          //stateWiseDataTotal = await stateWiseData.first;
          testingWiseData = testingWiseData;
        });
      }
    } else {
      if(mounted) {
        setState(() {
          //stateWiseDataTotal = await stateWiseDataTotal;
          testingWiseData = testingWiseData;
        });
      }
    }
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    print("object4");
    populateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: testingWiseData.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "Source: ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black87),
                        children: [
                          TextSpan(
                            text: "Click here",
                            style: TextStyle(fontSize: 16.0),
                            recognizer: TapGestureRecognizer(
                              //  _launchURL("${(testingWiseData[index].source.isNotEmpty ? testingWiseData[index].source : "Not Available")}");
                            )
                          ),
                        ],
                    ),
                  ),
                  RichText(
                     text: TextSpan(
                       text: "Sample: ",
                       style: TextStyle(fontSize: 16.0, color: Colors.black87),
                       children: [
                         TextSpan(
                           text: " ${(testingWiseData[index].samplereportedtoday.isNotEmpty ? testingWiseData[index].samplereportedtoday : "Not Available")}",
                           style: TextStyle(fontSize: 16.0),
                         ),
                       ]
                     ),
                  ),Text(
                    "Positive: ${(testingWiseData[index].positivecasesfromsamplesreported.isNotEmpty ? testingWiseData[index].positivecasesfromsamplesreported : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "By Private Labs: ${(testingWiseData[index].testsconductedbyprivatelabs.isNotEmpty ? testingWiseData[index].testsconductedbyprivatelabs : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Total Individual Test: ${(testingWiseData[index].totalindividualstested.isNotEmpty ? testingWiseData[index].totalindividualstested : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Total Sample: ${(testingWiseData[index].totalsamplestested.isNotEmpty ? testingWiseData[index].totalsamplestested : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Total Positive: ${(testingWiseData[index].totalpositivecases.isNotEmpty ? testingWiseData[index].totalpositivecases : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Updated On: ${(testingWiseData[index].updatetimestamp.isNotEmpty ? testingWiseData[index].updatetimestamp : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
