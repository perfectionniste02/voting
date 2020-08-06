import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:voting/models/evenements.dart';
import 'package:voting/widget/evenementItem.dart';
import 'package:voting/widget/texte.dart';

class EvenementsVue extends StatefulWidget {
  static const route = './evenementsPage';
  @override
  _EvenementsVueState createState() => _EvenementsVueState();
}

class _EvenementsVueState extends State<EvenementsVue> {
  List<Evenements> evernement = [];
  Future<Evenements> chargeEvenemengt() async {
    final String url =
        'http://172.31.247.7:8888/app-voting/api/app_voting_api/evenement/list.php';
    final reponse = await http.get(url);
    if (reponse.statusCode == 200) {
      List decode = json.decode(reponse.body);
      List<Evenements> list =
          decode.map((e) => Evenements.fromJson(e)).toList();
      print(list[0].date);
      if (list != evernement) {
        setState(() {
          evernement = list;
        });
      }
    } else {
      throw Exception("une erreur c'est produite");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    evernement = null;
    chargeEvenemengt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texte(
          "List des Evenements",
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      body: choixBody(),
    );
  }

  Widget choixBody() {
    if (evernement == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.deepOrange,
        ),
      );
    } else {
      if (evernement.length == 0) {
        return Center(
          child: Texte(
            'Aucun evernement',
            color: Colors.black,
          ),
        );
      } else {
        return ListView.builder(
          itemCount: evernement.length,
          itemBuilder: (context, i) {
            return EvenementItem(
              evernement[i].libelle,
              evernement[i].date,
              evernement[i].id,
            );
          },
        );
      }
    }
  }
}
