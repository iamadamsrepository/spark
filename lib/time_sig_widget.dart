import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spark/inspo_string_widget.dart';

class TimeSigWidget extends InspoStringWidget {
  TimeSigWidget({Key key}) : super(key: key);

  final String title = 'Time Signature';

  @override 
  TimeSigWidgetState createState() => TimeSigWidgetState();
}

class TimeSigWidgetState extends InspoStringWidgetState {
  static List<String> timeSigs = [
    '4/4', '4/4', '4/4', '4/4', '4/4', '4/4', '4/4', '4/4',
    '6/8', '6/8', '6/8', '6/8',
    '2/4', 
    '3/4', 
    '12/8',
  ];

  @override 
  void shuffle() {
    setState(() {
      inspoString = timeSigs[Random().nextInt(timeSigs.length)];
    });
  }
}