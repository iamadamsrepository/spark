import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spark/inspo_string_widget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class BPMWidget extends InspoStringWidget {
  BPMWidget({Key key}) : super(key: key);

  final String title = 'BPM';

  @override 
  BPMWidgetState createState() => BPMWidgetState();
}

class BPMWidgetState extends InspoStringWidgetState {
  static List<int> bpms = [
    60,60,60,
    65,
    70,
    75,
    80,80,80,80,80,
    85,85,
    90,90,90,90,90,
    95,95,
    100,100,100,100,100,
    105,105,105,105,
    110,110,110,110,110,
    115,115,115,115,
    120,120,120,120,120,
    125,125,
    130,130,130,130,
    135,135,135,
    140,140,140,140,140,
    145,145,
    150,150,150,150,
    155,155,
    160,160,160,160,160,
    165,165,
    170,170,170,
    175,175,
    180,180,180,180,180,
    185,
    190,190,
    195,
    200,
  ];

  bool metronomeOn = false;
  AudioPlayer audio = AudioPlayer();
  AudioCache cache = AudioCache();

  @override 
  void shuffle() {
    setState(() {
      inspoString = bpms[Random().nextInt(bpms.length)].toString();
    });
  }

  @override 
  Widget buildInspoVal() {
    return ConstrainedBox(
      child: Row(
        children: [
          super.buildInspoVal(),
          Spacer(),
          metronomeSwitch(),
        ],
      ),
      constraints: BoxConstraints(maxWidth: 150),);
  }

  Widget metronomeSwitch() {
    return IconButton(
      icon: metronomeOn 
          ? Icon(Icons.pause_circle_filled)
          : Icon(Icons.play_circle_outline), 
      iconSize: 40,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onPressed: () => {
        // setState(() {
        //   metronomeOn = metronomeOn ? false : true;
        // })
        toggleMetronome()
      });
  }

  void toggleMetronome() async{
    if (metronomeOn) {
      audio.stop();
    } else {
      audio = await cache.loop('metronome/metronome_$inspoString.wav');
    }
    setState(() {
      metronomeOn = metronomeOn ? false : true;
    });
  }
}