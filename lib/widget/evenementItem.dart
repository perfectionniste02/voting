import 'package:flutter/material.dart';
import 'package:voting/vue/equipeVue.dart';
import 'package:voting/widget/texte.dart';

class EvenementItem extends StatelessWidget {
  final String titre;
  final String date;
  final String id;

  EvenementItem(this.titre, this.date, this.id);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 120,
                  child: Text(
                    titre,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
                Chip(
                  label: Text(
                    date,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Equipes(
                                  id: id,
                                )));
                  },
                  child: Texte(
                    'VOTER',
                    color: Colors.deepOrange,
                  ),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
