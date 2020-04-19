import 'package:covid19world/Dto/daily-update.dart';
import 'package:covid19world/services/covid-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DateWiseUpdate extends StatefulWidget {
  @override
  _DateWiseUpdateState createState() => _DateWiseUpdateState();
}

class _DateWiseUpdateState extends State<DateWiseUpdate> {

  List<CasesTimeSeries> dailyUpdates = [];
  void populateData() async {
    if (dailyUpdates.isEmpty) {
      CovidIndiaService _covidIndiaService = CovidIndiaService();
      dailyUpdates = await _covidIndiaService.getDailyUpdate();
      print("dailyUpdates.first.casesTimeSeries2");
    }
    if(mounted) {
      setState(() {
        dailyUpdates = dailyUpdates;
      });
    }
    print(dailyUpdates.length);
    //Navigator.pushReplacementNamed(context, '/home'); //, arguments: country
  }

  @override
  void initState() {
    super.initState();
    print("object6");
    populateData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Table(
                border: TableBorder.symmetric(inside: BorderSide(width: 0.5)),
                children: [
                  TableRow(
                      decoration: BoxDecoration( color: Colors.blueAccent),
                      children: [
                        TableCell(child: Text("Date", style: TextStyle(height: 3.0), textAlign: TextAlign.center,), verticalAlignment: TableCellVerticalAlignment.top,),
                        TableCell(child: Text("Confirmed", style: TextStyle(height: 3.0), textAlign: TextAlign.center,),verticalAlignment: TableCellVerticalAlignment.top,),
                        TableCell(child: Text("Recovered", style: TextStyle(height: 3.0), textAlign: TextAlign.center,),verticalAlignment: TableCellVerticalAlignment.top,),
                        TableCell(child: Text("Deaths", style: TextStyle(height: 3.0), textAlign: TextAlign.center,),verticalAlignment: TableCellVerticalAlignment.top,),
                      ]
                  )
                ],
              ),
              Table(
                children: dailyUpdates.map<TableRow>((oneDay) => TableRow(
                    children: [
                      Text("${oneDay.date}", style: TextStyle(height: 2.0), textAlign: TextAlign.center,),
                      Text("${oneDay.dailyconfirmed}", style: TextStyle(height: 2.0), textAlign: TextAlign.center,),
                      Text("${oneDay.dailyrecovered}", style: TextStyle(height: 2.0), textAlign: TextAlign.center,),
                      Text("${oneDay.dailydeceased}", style: TextStyle(height: 2.0), textAlign: TextAlign.center,),
                    ]
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

