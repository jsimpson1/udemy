import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet',
                    style: theme.textTheme.title,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            // ListView.builder not use here b/c of but that doesnt handle changing state properly
            children: transactions
                .map(
                  (tx) => TransactionItem(
                      key: ValueKey(tx
                          .id), // not UniqueKey b/c then key changes on each rebuild
                      transaction: tx,
                      theme: theme,
                      deleteTx: deleteTx),
                )
                .toList(),
          );
  }
}
