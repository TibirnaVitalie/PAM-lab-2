// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Word counter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _initialTextController = TextEditingController();
  final _substringTextController = TextEditingController();
  String initialStringText = '';
  String substringText = '';
  int count = 0;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 400,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              controller: _initialTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type anything *',
                hintText: "Type here ...",
              ),
            ),
          ),
          Container(
            width: 400,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              controller: _substringTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a substring *',
                hintText: "Type here ...",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () {
                setState((){
                  count = 0;
                  initialStringText = (_initialTextController.text);
                  substringText = (_substringTextController.text);
                  initialStringText.split(' ').forEach((element) {  if(element.contains(substringText) ) count++;  });
                });
              },
              child: const Text('SUBMIT'),
            ),
          ),
          Text(
            'Result: $count',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}