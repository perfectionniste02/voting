import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voting/models/equipes_model.dart';
import 'package:voting/widget/texte.dart';
import 'package:http/http.dart' as http;

class Equipes extends StatefulWidget {
  static const route = '/equip';
  String id;
  Equipes({this.id});
  @override
  _EquipesState createState() => _EquipesState();
}

class _EquipesState extends State<Equipes> {
  Future<EquipesModels> recupEquipeInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recupEquipeInfo = chargeEquipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texte(
          "List des Equipe",
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      body: FutureBuilder(
          future: recupEquipeInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.only(top: 15),
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) => Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: ListTile(
                            leading: Padding(
                              padding: EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: FittedBox(child: Text('E')),
                                ),
                              ),
                            ),
                            title: Texte(
                              snapshot.data.data[i].libelle,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            subtitle: Text(snapshot.data.date),
                            trailing: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  //Navigator.of(context).pushNamed(Notes.route);
                                }),
                          ),
                        ),
                      ));
            } else if (snapshot.hasError) {
              return Texte("${snapshot.hasError}");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<EquipesModels> chargeEquipe() async {
    final String url =
        'http://172.31.247.7:8888/app-voting/api/app_voting_api/equipe/list.php?evenementId=${widget.id}';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      final equipIfon = EquipesModels.fromJson(decode);
      return equipIfon;
    } else {
      throw Exception("oups ! une erreur c'est produite");
    }
  }
}
