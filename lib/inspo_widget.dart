import 'package:flutter/material.dart';

class InspoWidget extends StatefulWidget {
  InspoWidget({Key key}) : super(key: key);

  final String title = 'Generic InspoWidget';

  @override 
  InspoWidgetState createState() => InspoWidgetState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return this.title;
  }
}

class InspoWidgetState extends State<InspoWidget> {//with AutomaticKeepAliveClientMixin<InspoWidget> {
  // bool shuffleOn = true;

  // bool get shuffleStatus => shuffleOn;
  // set shuffleStatus (bool s) => shuffleOn = s;

  bool get wantKeepAlive => true;

  @override 
  void initState() {
    super.initState();
    shuffle();
  }

  void shuffle() {
    next();
  }

  void next() {}

  Widget buildInspoVal() {
    return Text(widget.title);
  }

  @override 
  Widget build(BuildContext context) {
    // super.build(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),)),
          buildInspoVal(),
        ],
      ),
    );
  }  
}