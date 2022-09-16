import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 334,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: 300,
                  child: Image.asset(
                    "images/waiting.png",
                    // height: 300,
                    fit: BoxFit.cover,
                    // alignment: Ali,
                  ),
                ),
              ],
            )
          : ListView(
              children: transactions.map((tx) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(child: Text('${tx.amount}')),
                    ),
                    title: Text(tx.title),
                    subtitle: Text(DateFormat.yMMMd().format(tx.date)),
                    trailing: IconButton(
                      onPressed: () => deletetx(tx.id),
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
