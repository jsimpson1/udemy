import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.theme,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final ThemeData theme;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(
            child: Text('\$${transaction.amount}'),
          ),
        ),
      ),
      title: Text(
        transaction.title,
        style: theme.textTheme.title,
      ),
      subtitle: Text(
        DateFormat.yMMMEd().format(transaction.date),
      ),
      trailing: MediaQuery.of(context).size.width > 460
          ? FlatButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text('Delete'),
              textColor: theme.errorColor,
              onPressed: () => deleteTx(transaction.id),
            )
          : IconButton(
              icon: const Icon(Icons.delete),
              color: theme.errorColor,
              onPressed: () => deleteTx(transaction.id),
            ),
    );
  }
}
