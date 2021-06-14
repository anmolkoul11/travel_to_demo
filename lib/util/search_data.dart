import 'dart:convert';

import 'package:flutter/services.dart';

class SearchData {
  String name;
  String location;
  String details;
  String img;
  List<String> imgSet;

  SearchData({
    this.name,
    this.location,
    this.details,
    this.img,
    this.imgSet,
  });

  factory SearchData.fromJson(Map<String, dynamic> parsedJson) {
    return SearchData(
        name: parsedJson["name"] as String,
        location: parsedJson["location"] as String,
        details: parsedJson["details"] as String,
        img: parsedJson["img"] as String,
      imgSet: parsedJson["imgSet"] as List<String>,
    );
  }
}


class DataViewModel {
  static List<SearchData> sdata;

  static Future loadData() async {
    try {
       sdata = [];
      String jsonString = await rootBundle.loadString('assets/database.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['name'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        sdata.add(new SearchData.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }


}