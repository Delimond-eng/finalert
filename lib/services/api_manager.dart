import 'dart:convert';

import 'package:dio/dio.dart';
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
        url: "http://finalert.rtgroup-rdc.com/plaintes/nouvellePlainte",
        body:maps,
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
