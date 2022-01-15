class Plainte {
  String civilitePlaignant;
  String nomPlaignant;
  String emailPlaignant;
  String adressePlaignant;
  String telephonePlaignant;
  int territoirePlaignantId;
  int provincePlaignantId;
  String motifPlaignat;
  String phonePlaignantId;
  String gpsAlt;
  String gpsLat;
  String gpsLong;

  String nomAccuse;
  String typePreuve;
  String serviceAccuse;
  String provinceAccuse;
  String territoireAccuse;
  String entiteAccuse;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    if (civilitePlaignant != null) {
      data["Civilite"] = civilitePlaignant;
    }
    if (nomPlaignant != null) {
      data["Noms"] = nomPlaignant;
    }
    if (emailPlaignant != null) {
      data["Email"] = emailPlaignant;
    }
    if (telephonePlaignant != null) {
      data["Telephone"] = telephonePlaignant;
    }
    if (territoirePlaignantId != null) {
      data["TerritoireId"] = territoirePlaignantId;
    }
    if (provincePlaignantId != null) {
      data["ProvinceId"] = provincePlaignantId;
    }
    if (gpsAlt != null) {
      data["CoordonneeGPS_Altitude"] = gpsAlt;
    }
    if (gpsLat != null) {
      data["CoordonneeGPS_Latitude"] = gpsAlt;
    }
    if (gpsLong != null) {
      data["CoordonneeGPS_Precision"] = gpsLong;
    }
    if (nomAccuse != null) {
      data["NomAccuse"] = nomAccuse;
    }
    if (typePreuve != null) {
      data["TypeContenu"] = typePreuve;
    }
    if (phonePlaignantId != null) {
      data["PhoneId"] = phonePlaignantId;
    }
    if (serviceAccuse != null) {
      data["ServiceAccuse"] = serviceAccuse;
    }

    if (provinceAccuse != null) {
      data["ProvinceAccuse"] = provinceAccuse;
    }

    if (territoireAccuse != null) {
      data["LocalisationAccuse"] = territoireAccuse;
    }

    if (entiteAccuse != null) {
      data["EntiteAccuse"] = entiteAccuse;
    }

    return data;
  }
}
