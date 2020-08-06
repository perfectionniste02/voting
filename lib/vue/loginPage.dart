import 'package:flutter/material.dart';
import 'package:voting/vue/evenementVue.dart';
import 'package:voting/widget/texte.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Texte(
          "App Voting",
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      body: input(),
    );
  }

  Widget input() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Texte(
                'Soyer la bienvenue',
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Entre votre mail',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, EvenementsVue.route);
                },
                child: Texte('Valider'),
                color: Colors.deepOrange,
              )
            ],
          ),
        ),
      ),
    );
  }
}
