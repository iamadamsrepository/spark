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

class InspoWidgetState extends State<InspoWidget> with AutomaticKeepAliveClientMixin<InspoWidget>{
  bool shuffleOn = true;
  bool get shuffleStatus => shuffleOn;

  bool get wantKeepAlive => true;

  @override 
  void initState() {
    super.initState();
    shuffle();
  }

  void shuffle() {
    if (shuffleOn) next();
  }

  void next() {}

  void toggleShuffle() {
    setState(() {
      shuffleOn = !shuffleOn;
    });
  }

  Widget buildInspoVal() {
    return Text(widget.title);
  }

  @override 
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold)
            )
          ),
          buildInspoVal(),
          Spacer(),
          if (shuffleOn) IconButton(icon: Icon(Icons.shuffle), onPressed: toggleShuffle)
          else IconButton(icon: Icon(Icons.ac_unit), onPressed: toggleShuffle)
        ],
      ),
    );
  }  
}