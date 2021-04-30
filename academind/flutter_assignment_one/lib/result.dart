import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final text;

  Result(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
