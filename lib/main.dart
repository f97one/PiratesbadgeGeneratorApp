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
            Center(
              child: Text('Arrr! Me name is'),
            ),
            Center(
              child: Text(_piratesName),
            ),
          ]),
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
