import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String title;
  final Function handler;

  const AdaptiveFlatButton({this.title, this.handler});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (Platform.isIOS) {
      return CupertinoButton(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: handler,
      );
    } else {
      return FlatButton(
        textColor: theme.primaryColor,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: handler,
      );
    }
  }
}
