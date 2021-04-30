// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text

import 'package:flutter/material.dart';

import './result.dart';
import './text_control.dart';

void main() => runApp(AssignmentOne());

class AssignmentOne extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AssignmentOne> {
  int buttonPresses = 0;
  String prefix = 'button has been pressed';
  var visibleText = 'press the button';

  void changeText() {
    buttonPresses += 1;
    setState(() {
      visibleText = '$prefix $buttonPresses';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Result(visibleText),
            TextControl(changeText),
          ],
        ),
      ),
    );
  }
}
