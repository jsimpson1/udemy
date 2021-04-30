import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function changeTextHandler;

  TextControl(this.changeTextHandler);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: changeTextHandler,
      child: Text("change text"),
    );
  }
}
