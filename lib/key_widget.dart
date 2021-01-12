import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spark/inspo_string_widget.dart';

class KeyWidget extends InspoStringWidget {
  KeyWidget({Key key}) : super(key: key);

  final String title = 'Key';

  @override 
  KeyWidgetState createState() => KeyWidgetState();
}

class KeyWidgetState extends InspoStringWidgetState {
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

  @override 
  void shuffle() {
    setState(() {
      inspoString = keys[Random().nextInt(keys.length)] 
                  + ' ' + majmin[Random().nextInt(majmin.length)];
    });
  }
}