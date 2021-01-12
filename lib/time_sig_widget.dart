import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spark/inspo_widget.dart';

class TimeSigWidget extends InspoWidget {
  TimeSigWidget({Key key}) : super(key: key);

  final String title = 'Time Signature';

  @override 
  TimeSigWidgetState createState() => TimeSigWidgetState();
}

class TimeSigWidgetState extends InspoWidgetState {
  static List<String> timeSigs = [
    '4/4', '4/4', '4/4', '4/4', '4/4',
    '6/8', '6/8', '6/8',
    '2/4', 
    '3/4', 
    '12/8',
  ];
  String timeSig;

  @override 
  void next() {
    setState(() {
      timeSig = timeSigs[Random().nextInt(timeSigs.length)];
    });
  }

  @override 
  Widget buildInspoVal() {
    return Text(timeSig);
  }
}