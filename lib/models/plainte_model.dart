class PlaintePlaignant {
  String civilitePlaignant;
  String nomPlaignant;
  String emailPlaignant;
  String adressePlaignant;
  String telephonePlaignant;
  int territoirePlaignantId;
  int provincePlaignantId;
  String phonePlaignantId;
  String gpsAlt;
  String gpsLat;
  String gpsLong;
  String gpsPs;
  PlaintePlaignant({
    this.civilitePlaignant,
    this.nomPlaignant,
    this.emailPlaignant,
    this.adressePlaignant,
    this.telephonePlaignant,
    this.territoirePlaignantId,
    this.provincePlaignantId,
    this.phonePlaignantId,
    this.gpsAlt,
    this.gpsLat,
    this.gpsLong,
    this.gpsPs,
  });

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
      data["CoordonneeGPS_Longitude"] = gpsLong;
    }
    if (gpsPs != null) {
      data["CoordonneeGPS_Precision"] = gpsPs;
    }
    if (phonePlaignantId != null) {
      data["PhoneId"] = phonePlaignantId;
    }

    if(adressePlaignant != null){
      data["Adresse"] = adressePlaignant;
    }

    return data;
  }
}

class PlainteAccuse {
  String nomAccuse;
  String typePreuve;
  String serviceAccuse;
  String provinceAccuse;
  String territoireAccuse;
  String entiteAccuse;
  String motifAccuse;
  PlainteAccuse({
    this.nomAccuse,
    this.typePreuve,
    this.serviceAccuse,
    this.provinceAccuse,
    this.territoireAccuse,
    this.entiteAccuse,
    this.motifAccuse,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();

    if (nomAccuse != null) {
      data["NomAccuse"] = nomAccuse;
    }
    if (typePreuve != null) {
      data["TypeContenu"] = typePreuve;
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

    if (motifAccuse != null) {
      data["MotifPlainte"] = motifAccuse;
    }

    if(typePreuve != null){
      data["TypeContenu"] = typePreuve;
    }

    return data;
  }
}
