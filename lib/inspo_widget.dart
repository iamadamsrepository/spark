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

class InspoWidgetState extends State<InspoWidget> {
  @override 
  void initState() {
    super.initState();
    shuffle();
  }

  void shuffle() {}

  Widget buildInspoVal() {
    return Text(widget.title);
  }

  @override 
  Widget build(BuildContext context) {
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
          buildInspoVal()
        ],
      ),
    );
  }  
}