class Annonces {
  int id;
  String dateAnnonce;
  String titreAnnonce;
  String contenuAnnonce;

  Annonces({this.id, this.dateAnnonce, this.titreAnnonce, this.contenuAnnonce});

  Annonces.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    dateAnnonce = json['DateAnnonce'];
    titreAnnonce = json['TitreAnnonce'];
    contenuAnnonce = json['ContenuAnnonce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['DateAnnonce'] = this.dateAnnonce;
    data['TitreAnnonce'] = this.titreAnnonce;
    data['ContenuAnnonce'] = this.contenuAnnonce;
    return data;
  }
}
