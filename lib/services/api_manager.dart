import 'dart:convert';

import 'package:finalert/models/plainte_model.dart';

import 'api_service.dart';

class ApiManager {
  static Future view(String url) async {
    var result;
    try {
      result = await ApiService.request(
        url: url,
        method: "get",
      );
    } catch (err) {
      print("error from home getdata void $err");
    }
    if (result != null) {
      var json = jsonDecode(result);
      return json;
    } else {
      return null;
    }
  }

  static Future savePlainte(
      {PlaintePlaignant infosPlaignant, PlainteAccuse infosAccuse}) async {
    Map<String, dynamic> maps = {
      ...infosPlaignant.toMap(),
      ...infosAccuse.toMap(),
    };
    var result;
    try {
      result = await ApiService.request(
        url: "tonocfapi/api/requestplaintes/Saveplainte",
        body: maps,
        method: "post",
      );
    } catch (err) {
      print("error from home getdata void $err");
    }
    print(result);
    if (result != null) {
      var json = jsonDecode(result);
      return json;
    } else {
      return null;
    }
  }
}
