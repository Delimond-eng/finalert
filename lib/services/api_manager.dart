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

  static Future denoncerPlainte({Plainte plainte}) async {
    var result;
    try {
      result = await ApiService.request(
        url: "tonocfapi/api/requestplaintes/Saveplainte",
        body: plainte.toMap(),
        method: "post",
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
}
