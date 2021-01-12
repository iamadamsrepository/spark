import 'package:flutter/material.dart';
import 'package:spark/inspo_widget.dart';
import 'package:random_color/random_color.dart';

class ColourWidget extends InspoWidget {
  ColourWidget({Key key}) : super(key: key);

  final String title = 'Colour';

  @override 
  ColourWidgetState createState() => ColourWidgetState();
}

class ColourWidgetState extends InspoWidgetState {
  final RandomColor randomColour = RandomColor();
  Color colour;

  @override 
  void next() {
    setState(() {
      colour = randomColour.randomColor();
    });
  }

  @override 
  Widget buildInspoVal() {
    return Container(
      height: 150, width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)), 
        color: colour),
    );
  }
}