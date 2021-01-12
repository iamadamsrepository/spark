import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spark/inspo_widget.dart';

class KeyWidget extends InspoWidget {
  KeyWidget({Key key}) : super(key: key);

  final String title = 'Key';

  @override 
  KeyWidgetState createState() => KeyWidgetState();
}

class KeyWidgetState extends InspoWidgetState {
  List<String> keys = [
    'A', 'A',
    'A#', 'B♭',
    'B', 'B',
    'C', 'C',
    'C#', 'C♭',
    'D', 'D',
    'D#', 'E♭',
    'E', 'E',
    'F', 'F',
    'F#', 'G♭',
    'G', 'G',
    'G#', 'A♭',
  ];

  List<String> majmin = ['Major', 'Minor'];

  String key;
  String morm;

  @override 
  void next() {
    setState(() {
      key = keys[Random().nextInt(keys.length)];
      morm = majmin[Random().nextInt(majmin.length)];
    });
  }

  @override 
  Widget buildInspoVal() {
    return Text('$key $morm');
  }
}