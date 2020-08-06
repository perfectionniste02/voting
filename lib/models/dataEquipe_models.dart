class DataEquipes {
  final String id;
  final String libelle;
  final String eventID;
  DataEquipes({this.id, this.libelle, this.eventID});
  factory DataEquipes.fromJson(Map<String, dynamic> json) {
    return DataEquipes(
        id: json['Id'], libelle: json['Libelle'], eventID: json['EvenementId']);
  }
}
