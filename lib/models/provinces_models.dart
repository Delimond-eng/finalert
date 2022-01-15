class Provinces {
  String id;
  String libelleVille;

  Provinces({this.id, this.libelleVille});

  Provinces.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    libelleVille = json['LibelleVille'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$id'] = this.id;
    data['LibelleVille'] = this.libelleVille;
    return data;
  }
}
