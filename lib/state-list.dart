import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:covid19world/Dto/state-district-wise.dart';
import 'package:covid19world/services/covid-service.dart';
import 'package:covid19world/Dto/daily-update.dart';

class StateListPage extends StatefulWidget {
  @override
  _StateListPageState createState() => _StateListPageState();
}

class _StateListPageState extends State<StateListPage> {
  List<Statewise> stateWiseData = [];
  Statewise stateWiseDataTotal = Statewise();
  List<StateDistrictWise> stateDistrictWiseData = [];
  CovidIndiaService _covidIndiaService = CovidIndiaService();
  void populateData() async {
    if (stateWiseData.isEmpty) {
      stateWiseData = await _covidIndiaService.getStateWiseUpdate();

      if(mounted) {
        setState(() {
          //stateWiseDataTotal = await stateWiseData.first;
          stateWiseData = stateWiseData;
        });

        var stream = new Stream.periodic(const Duration(minutes: 1), (count) {
          // do something every hour
          // return the result of that something
        });

        stream.listen((result) {
          if(mounted) {
            setState(() {
              //stateWiseDataTotal = await stateWiseData.first;
              stateWiseData = stateWiseData;
              print("Page refreshed STW");
            });
          }
        });
      }
    } else {
      if(mounted) {
        setState(() {
          //stateWiseDataTotal = await stateWiseDataTotal;
          stateWiseData = stateWiseData;
        });
      }
    }
    if(stateDistrictWiseData.isEmpty) {
      stateDistrictWiseData = await _covidIndiaService.getStateDistrictWiseUpdate();
    }

    print(stateWiseData.length);
    //Navigator.pushReplacementNamed(context, '/home'); //, arguments: country
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
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(stateWiseData.length, (index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    title: Text(
                      '${stateWiseData != null ? stateWiseData[index].state : 'Loading...'}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Active: ${stateWiseData[index].active}",
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            "Confirmed: ${stateWiseData[index].confirmed}",
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            "Death: ${stateWiseData[index].deaths}",
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            "Recovered: ${stateWiseData[index].recovered}",
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            "Updated: ${stateWiseData[index].lastupdatedtime.split(" ")[0]}",
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            "Time: ${stateWiseData[index].lastupdatedtime.split(" ")[1]}",
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      hoverColor: Colors.red,
                      onPressed: () {
                        var stateDetail = stateWiseData[index];
                        var stateDistictDetail = stateDistrictWiseData.firstWhere((m) => m.state.toLowerCase() == stateDetail.state.toLowerCase());
                        Navigator.pushNamed(context, "/district", arguments: stateDistictDetail);
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "View Detail",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      )
    );
  }
}
