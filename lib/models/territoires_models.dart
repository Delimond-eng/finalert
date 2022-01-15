class Territoires {
  int id;
  String libelleTerritoire;
  int villeId;

  Territoires({this.id, this.libelleTerritoire, this.villeId});

  Territoires.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    libelleTerritoire = json['LibelleTerritoire'];
    villeId = json['VilleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['LibelleTerritoire'] = this.libelleTerritoire;
    data['VilleId'] = this.villeId;
    return data;
  }
}
