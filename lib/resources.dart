import 'package:covid19world/Dto/resource.dart';
import 'package:flutter/material.dart';

import 'services/covid-service.dart';

class ResourceListPage extends StatefulWidget {
  @override
  _ResourceListPageState createState() => _ResourceListPageState();
}

class _ResourceListPageState extends State<ResourceListPage> {
  List<Resources> resourcesList = [];
  CovidIndiaService _covidIndiaService = CovidIndiaService();
  void populateData() async {
    if (resourcesList.isEmpty) {
      resourcesList = await _covidIndiaService.getResources();
      if(mounted) {
        setState(() {
          //stateWiseDataTotal = await stateWiseData.first;
          resourcesList = resourcesList;
        });
      }
    } else {
      if(mounted) {
        setState(() {
          //stateWiseDataTotal = await stateWiseDataTotal;
          resourcesList = resourcesList;
        });
      }
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
        itemCount: resourcesList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Category: ${(resourcesList[index].category.isNotEmpty ? resourcesList[index].category : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Name: ${(resourcesList[index].nameoftheorganisation.isNotEmpty ? resourcesList[index].nameoftheorganisation : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Description: ${(resourcesList[index].descriptionandorserviceprovided.isNotEmpty ? resourcesList[index].descriptionandorserviceprovided : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Phone: ${(resourcesList[index].phonenumber.isNotEmpty ? resourcesList[index].phonenumber : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "Web: ${(resourcesList[index].contact.isNotEmpty ? resourcesList[index].contact : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),Text(
                    "City: ${(resourcesList[index].city.isNotEmpty ? resourcesList[index].city : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "State: ${(resourcesList[index].state.isNotEmpty ? resourcesList[index].state : "Not Available")}",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
