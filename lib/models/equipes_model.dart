import 'dataEquipe_models.dart';

class EquipesModels {
  final String id;
  final String date;
  final List<DataEquipes> data;
  EquipesModels({this.date, this.data, this.id});
  factory EquipesModels.fromJson(Map<String, dynamic> json) {
    List datajson = json['data'];
    List<DataEquipes> dataList =
        datajson.map((d) => DataEquipes.fromJson(d)).toList();
    return EquipesModels(
      id: json['Id'],
      date: json['Date'],
      data: dataList,
    );
  }
}
