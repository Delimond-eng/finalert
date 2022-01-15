import 'package:finalert/models/annonce_models.dart';
import 'package:finalert/models/entity_models.dart';
import 'package:finalert/models/provinces_models.dart';
import 'package:finalert/models/territoires_models.dart';
import 'package:finalert/models/type_plainte_models.dart';
import 'package:finalert/services/api_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  var provinces = <Provinces>[].obs;
  var territoires = <Territoires>[].obs;
  var entites = <Entites>[].obs;
  var annonces = <Annonces>[].obs;
  var typePlaintes = <TypePlaintes>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDatas();
  }

  Future<void> loadDatas() async {
    await ApiManager.view("tonocfapi/api/requestplaintes/GetProvinces")
        .then((res) {
      res.forEach((e) {
        provinces.add(Provinces.fromJson(e));
      });
    });
    await ApiManager.view("tonocfapi/api/requestplaintes/GetTerritoires")
        .then((res) {
      res.forEach((e) {
        territoires.add(Territoires.fromJson(e));
      });
    });
    await ApiManager.view("tonocfapi/api/requestplaintes/GetEntites")
        .then((res) {
      res.forEach((e) {
        entites.add(Entites.fromJson(e));
      });
    });
    await ApiManager.view("tonocfapi/api/requestplaintes/GetTypePlainte")
        .then((res) {
      res.forEach((e) {
        typePlaintes.add(TypePlaintes.fromJson(e));
      });
    });
    await ApiManager.view("tonocfapi/api/requestplaintes/GetAnnonces")
        .then((res) {
      res.forEach((e) {
        annonces.add(Annonces.fromJson(e));
      });
    });
  }
}
