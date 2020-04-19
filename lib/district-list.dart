import 'package:covid19world/Dto/state-district-wise.dart';
import 'package:flutter/material.dart';

class DistrictListPage extends StatefulWidget {
  @override
  _DistrictListPageState createState() => _DistrictListPageState();
}

class _DistrictListPageState extends State<DistrictListPage> {
  @override
  void initState() {
    super.initState();
    print("object5");
  }

  @override
  Widget build(BuildContext context) {

    StateDistrictWise stateDetail = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "${stateDetail.state}",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70
              ),
            ),
          ),
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: List.generate(stateDetail.districtData.length, (index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        title: Text(
                          '${stateDetail.districtData != null ? stateDetail.districtData[index].district : 'Loading...'}',
                          style: TextStyle(
                            fontSize: 18.0,
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
                                "Confirmed: ${stateDetail.districtData[index].confirmed}",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                ),
                              ),
                              Text(
                                "Delta Confirmed: ${stateDetail.districtData[index].delta.confirmed}",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                        )
                    ),

                  ],
                ),
              );
            }),
          )
      ),
    );
  }
}
