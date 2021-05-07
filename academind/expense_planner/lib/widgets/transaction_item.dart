import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.theme,
    @required this.deleteTx,
  }) : super(key: key); // constructor initializer list

  final Transaction transaction;
  final ThemeData theme;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const avaiableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];
    // no setState needed b/c this happens before build() runs
    _bgColor = avaiableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: _bgColor,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(
            child: Text('\$${widget.transaction.amount}'),
          ),
        ),
      ),
      title: Text(
        widget.transaction.title,
        style: widget.theme.textTheme.title,
      ),
      subtitle: Text(
        DateFormat.yMMMEd().format(widget.transaction.date),
      ),
      trailing: MediaQuery.of(context).size.width > 460
          ? FlatButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text('Delete'),
              textColor: widget.theme.errorColor,
              onPressed: () => widget.deleteTx(widget.transaction.id),
            )
          : IconButton(
              icon: const Icon(Icons.delete),
              color: widget.theme.errorColor,
              onPressed: () => widget.deleteTx(widget.transaction.id),
            ),
    );
  }
}
