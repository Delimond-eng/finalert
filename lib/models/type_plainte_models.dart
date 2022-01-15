class TypePlaintes {
  int id;
  String libelleTypePlainte;
  int entiteAccuseId;

  TypePlaintes({this.id, this.libelleTypePlainte, this.entiteAccuseId});

  TypePlaintes.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    libelleTypePlainte = json['LibelleTypePlainte'];
    entiteAccuseId = json['EntiteAccuseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['LibelleTypePlainte'] = this.libelleTypePlainte;
    data['EntiteAccuseId'] = this.entiteAccuseId;
    return data;
  }
}
