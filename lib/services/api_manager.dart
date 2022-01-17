import 'dart:convert';
import 'package:finalert/models/plainte_model.dart';
import 'package:http/http.dart' as http;

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
    //print("Data : ******* $maps ******");
    http.Response result;
    try {
      result =await http.post(
        Uri.parse("https://finalert.rtgroup-rdc.com/plaintes/nouvellePlainte"),
        body: jsonEncode(maps),
      );
    } catch (err) {
      print("error from home getdata void $err");
    }
    var jsonData = jsonDecode(result.body);
    print("result $jsonData");
    /*if (result != null) {
      var json = jsonDecode(result);
      return json;
    } else {
      return null;
    }*/
    /*var response = await Dio().post("https://finalertemanage.com/tonocfapi/api/requestplaintes/Saveplainte", data: {
      "Civilite":infosPlaignant.civilitePlaignant,
      "Noms":infosPlaignant.nomPlaignant,
      "Email":infosPlaignant.emailPlaignant,
      "Adresse":infosPlaignant.adressePlaignant,
      "Telephone": infosPlaignant.telephonePlaignant,
      "TerritoireId": infosPlaignant.territoirePlaignantId,
      "ProvinceId": infosPlaignant.provincePlaignantId,
      "MotifPlainte":infosAccuse.motifAccuse,
      "CoordonneGPS_Altitude": infosPlaignant.gpsAlt,
      "CoordonneGPS_Latitude": infosPlaignant.gpsLat,
      "CoordonneGPS_Longitude": infosPlaignant.gpsLong,
      "CoordonneGPS_Precision": infosPlaignant.gpsPs,
      "NomAccuse": infosAccuse.nomAccuse,
      "TypeContenu":infosAccuse.typePreuve,
      "PhoneId":infosPlaignant.phonePlaignantId,
      "ServiceAccuse":infosAccuse.serviceAccuse,
      "ProvinceAccuse": infosAccuse.provinceAccuse,
      "LocalisationAccuse":infosAccuse.territoireAccuse,
      "EntiteAccuse":infosAccuse.entiteAccuse
    });

    print(response.statusCode);*/
  }
}
