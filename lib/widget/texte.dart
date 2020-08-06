import 'package:flutter/material.dart';

class Texte extends Text {
  Texte(data,
      {color: Colors.white,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 18.0})
      : super(
          data,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontStyle: fontStyle,
              fontWeight: fontWeight),
        );
}
