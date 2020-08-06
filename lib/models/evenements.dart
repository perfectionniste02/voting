class Evenements {
  final String id;
  final String libelle;
  final String date;
  Evenements({this.id, this.libelle, this.date});
  factory Evenements.fromJson(Map<String, dynamic> json) {
    return Evenements(
        id: json['Id'], libelle: json['Libelle'], date: json['Date']);
  }
}
