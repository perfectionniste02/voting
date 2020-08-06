import 'package:flutter/material.dart';
import 'package:voting/vue/evenementVue.dart';

import 'equipeVue.dart';
import 'loginPage.dart';

class Voting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: LoginPage(),
      routes: {
        EvenementsVue.route: (context) => EvenementsVue(),
        Equipes.route: (context) => Equipes(),
      },
    );
  }
}
