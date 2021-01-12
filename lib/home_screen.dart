import 'package:flutter/material.dart';
import 'package:spark/artwork_widget.dart';
import 'package:spark/colour_widget.dart';
import 'package:spark/inspo_widget.dart';
import 'package:spark/bpm_widget.dart';
import 'package:spark/key_widget.dart';
import 'package:spark/time_sig_widget.dart';
import 'package:spark/word_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();

  final List<Function> inspoWidgetsToInit = [
    (key) => BPMWidget(key: key),
    (key) => KeyWidget(key: key),
    (key) => TimeSigWidget(key: key),
    (key) => WordWidget(key: key),
    (key) => ColourWidget(key: key),
    (key) => ArtworkWidget(key: key),
    ];
  List<GlobalKey<InspoWidgetState>> inspoWidgetsStateKeys = [];
  List<InspoWidget> inspoWidgets = [];
  List<bool> inspoWidgetsShowable = [];
  List<bool> inspoWidgetsShufflable = [];

  GlobalKey<ColourWidgetState> colourKey;

  @override 
  void initState() {
    super.initState();
    for(int i = 0; i < inspoWidgetsToInit.length; i++) {
      Function widgetType = inspoWidgetsToInit[i];
      GlobalKey<InspoWidgetState> key;
      if (i == 4)  {
        key = GlobalKey<ColourWidgetState>();
        colourKey = key;
      }
      else key = GlobalKey<InspoWidgetState>();
      InspoWidget widget = widgetType(key);
      inspoWidgetsStateKeys.add(key);
      inspoWidgets.add(widget);
      inspoWidgetsShowable.add(true);
      inspoWidgetsShufflable.add(true);
    }
    setState(() {});
  }

  void shuffle() {
    for(final key in inspoWidgetsStateKeys) {
      if(key.currentState != null && inspoWidgetsShufflable[inspoWidgetsStateKeys.indexOf(key)]) 
        key.currentState.shuffle();
    }
    setState(() {});
  }

  void openInspoWidgetSelector() {
    homeScreenKey.currentState.openEndDrawer();
  }

  void closeInspoWidgetSelector() {
    Navigator.of(context).pop();
  }

  void openSpiel() {
    homeScreenKey.currentState.openDrawer();
  }

  void closeSpiel() {
    Navigator.of(context).pop();
  }

  bool isSelected(widget) {
    return inspoWidgetsShowable[inspoWidgets.indexOf(widget)];
  }

  Color getColour() {
    if (colourKey.currentState != null)
      return colourKey.currentState.colour;
    else return Theme.of(context).primaryColor;
  }

  Widget shuffeToggle(widget) {
    if (inspoWidgetsShufflable[inspoWidgets.indexOf(widget)]) 
      return IconButton(icon: Icon(Icons.check_circle_outline, size: 25), onPressed: () {
        setState(() {
          inspoWidgetsShufflable[inspoWidgets.indexOf(widget)] = false;
        });
      });
    else
      return IconButton(icon: Icon(Icons.check_circle, size: 25), onPressed: () {
        setState(() {
          inspoWidgetsShufflable[inspoWidgets.indexOf(widget)] = true;
        });
      });
  }

  @override
  Widget build (BuildContext context) {
    Color bgColour = getColour();
    Color fgColour = bgColour.computeLuminance() > 0.55 
                   ? Colors.black : Colors.white;

    return Scaffold(
      key: homeScreenKey,

      appBar: AppBar(
        title: Text(
          'writersblok',
          style: TextStyle(color: fgColour),
        ),
        backgroundColor: bgColour,
        actions: <Widget>[
          Padding (
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.create, size: 30, color: fgColour), 
              onPressed: openInspoWidgetSelector,
            ),
          )
        ],
        leading: Padding (
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(Icons.help, size: 30, color: fgColour), 
            onPressed: openSpiel,
          ),
        ),
      ),

      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < inspoWidgets.length; i++)
              CheckboxListTile(
                value: inspoWidgetsShowable[i], 
                onChanged: (bool value) {
                  setState(() {
                    inspoWidgetsShowable[i] = value;
                  });
                },
                title: Text(inspoWidgets[i].toString()),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.black
              ),
            ]
        ),
      ),

      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Put Spiel Here')
            ]
        ),
      ),

      body: SingleChildScrollView(
              child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // children: inspoWidgets,
            children: [for (var widget in inspoWidgets.where((widget) => isSelected(widget)).toList())
              Row(
                children: [
                  widget,
                  Spacer(),
                  shuffeToggle(widget)
                ],
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shuffle, color: fgColour),
        onPressed: shuffle,
        backgroundColor: bgColour,
      ),
    );
  }
}