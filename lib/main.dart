import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static String APP_TITLE = 'Pirates Badge';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainContents(),
    );
  }
}

class MainContents extends StatefulWidget {
  _MainContentsState createState() => _MainContentsState();
}

class _MainContentsState extends State<MainContents> {
  String _piratesName = '';

  final List<String> _names = ['Anne', 'Mary', 'Jack', 'Morgan', 'Roger', 'Bill', 'Ragnar', 'Ed', 'John', 'Jane'];
  final List<String> _appellations = [
    'Jackal',
    'King',
    'Red',
    'Stalwart',
    'Axe',
    'Young',
    'Brave',
    'Eager',
    'Wily',
    'Zesty'
  ];

  final nameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.APP_TITLE),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: nameEditingController,
              decoration: InputDecoration(
                hintText: 'Arrr! Write yer name!',
                border: OutlineInputBorder(),
              ),
              maxLength: 16,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
            child: RaisedButton(
              onPressed: _updateBadge,
              child: Text(
                'Aye! Gimme a name!',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Colors.red,
                  width: 12.0,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(0.0),
                  bottomLeft: Radius.circular(0.0),
                ),
              ),
              child: Center(
                child: Text(
                  'Arrr! Me name is',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                border: BorderDirectional(
                  start: BorderSide(
                    color: Colors.red,
                    width: 12.0,
                  ),
                  end: BorderSide(
                    color: Colors.red,
                    width: 12.0,
                  ),
                  top: BorderSide(
                    color: Colors.red,
                    width: 0.0,
                  ),
                  bottom: BorderSide(
                    color: Colors.red,
                    width: 0.0,
                  ),
                ),
              ),
              child: SizedBox(
                height: 96.0,
                child: Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Center(
                    child: Text(
                      _piratesName,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border(
                  top: BorderSide(
                    width: 0.0,
                    color: Colors.red,
                  ),
                  left: BorderSide(
                    width: 12.0,
                    color: Colors.red,
                  ),
                  right: BorderSide(
                    width: 12.0,
                    color: Colors.red,
                  ),
                  bottom: BorderSide(
                    width: 12.0,
                    color: Colors.red,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateBadge() {
    setState(() {
      final Random idx = Random();

      String _firstName =
          nameEditingController.text.isEmpty ? _names[idx.nextInt(_names.length)] : nameEditingController.text;
      String _appellation = _appellations[idx.nextInt(_appellations.length)];
      _piratesName = '$_firstName the $_appellation';
    });
  }
}
