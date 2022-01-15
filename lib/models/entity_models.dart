class Entites {
  int id;
  String nomEntite;

  Entites({this.id, this.nomEntite});

  Entites.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nomEntite = json['NomEntite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['NomEntite'] = this.nomEntite;
    return data;
  }
}
