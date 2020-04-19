import 'dart:convert';
import 'package:covid19world/Dto/daily-update.dart';
import 'package:covid19world/Dto/resource.dart';
import 'package:covid19world/Dto/state-district-wise.dart';
import 'package:http/http.dart';

class CovidIndiaService {
  String baseUrl = "https://api.covid19india.org/";

  Future<List<dynamic>> getResponseBody(url) async {
    var response = await get(baseUrl + url);
    var data = jsonDecode(response.body);
    print(data.runtimeType);
    return data;
  }

  Future<List<dynamic>> getResponseBodyObject(url) async {
    var response = await get(baseUrl + url);
    var data = jsonDecode("[${response.body}]");
    print(data.runtimeType);
    return data;
  }

  Future<List<CasesTimeSeries>> getDailyUpdate() async {
    var data = (await getResponseBodyObject("data.json"));
    List<DailyUpdate> dailyUpdates = data.map((a) => DailyUpdate.fromJson(a)).toList();
    print("dailyUpdates.first.casesTimeSeries1");
    return dailyUpdates.first.casesTimeSeries;
  }

  Future<List<StateDistrictWise>> getStateDistrictWiseUpdate() async {
    var data = (await getResponseBody("v2/state_district_wise.json"));
    List<StateDistrictWise> stateWiseUpdate = data.map((a) => StateDistrictWise.fromJson(a)).toList();
    return stateWiseUpdate;
  }

  Future<List<Statewise>> getStateWiseUpdate() async {
    var data = (await getResponseBodyObject("data.json"));
    List<DailyUpdate> dailyUpdates = data.map((a) => DailyUpdate.fromJson(a)).toList();
    return dailyUpdates.first.statewise;
  }

  Future<List<Tested>> getTestingWiseUpdate() async {
    var data = (await getResponseBodyObject("data.json"));
    List<DailyUpdate> dailyUpdates = data.map((a) => DailyUpdate.fromJson(a)).toList();
    return dailyUpdates.first.tested;
  }

  Future<List<Resources>> getResources() async {
    var data = (await getResponseBodyObject("resources/resources.json"));
    List<Resource> resources = data.map((a) => Resource.fromJson(a)).toList();
    return resources.first.resources;
  }


}