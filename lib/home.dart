import 'package:covid19world/Dto/state-district-wise.dart';
import 'package:covid19world/date-wise-update.dart';
import 'package:covid19world/resources.dart';
import 'package:covid19world/services/covid-service.dart';
import 'package:covid19world/testing.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:covid19world/state-list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _StateListPageStateWiget = StateListPage();
  var _DateWiseUpdateWidget = DateWiseUpdate();
  var _testingPage = TestingList();
  var _resourceListPage = ResourceListPage();
  var _currentTime = formatDate(DateTime.now(), [hh, ':', nn, ' ', am]);


  void RefreshData(){
    var stream = new Stream.periodic(const Duration(minutes: 1), (count) {
      // do something every hour
      // return the result of that something
    });

    stream.listen((result) {
      if(mounted) {
        setState(() {
          _StateListPageStateWiget = StateListPage();
          _DateWiseUpdateWidget = DateWiseUpdate();
          _testingPage = TestingList();
          _resourceListPage = ResourceListPage();
          _currentTime = formatDate(DateTime.now(), [hh, ':', nn, ' ', am]);
          print("Page refreshed");
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    RefreshData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Text('State Wise', style: TextStyle(fontSize: 12.0, height: 5.0),),
                  Text('Date Wise', style: TextStyle(fontSize: 12.0, height: 5.0),),
                  Text('Testing', style: TextStyle(fontSize: 12.0, height: 5.0),),
                  Text('Labs', style: TextStyle(fontSize: 12.0, height: 5.0),),
                ],
              ),
              title: Text("Covid-19 India - Updated: ${_currentTime}"),
            ),
            body: TabBarView(
              children: [
                _StateListPageStateWiget,
                _DateWiseUpdateWidget,
                _testingPage,
                _resourceListPage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
