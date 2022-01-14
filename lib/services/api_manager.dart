import 'dart:convert';

import 'api_service.dart';

class ApiManager {
  static Future viewCategories() async {
    var result;
    try {
      result = await ApiService.request(
        url: "/content/config/menu",
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
}
