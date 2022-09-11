import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 334,
      child: ListView(
        children: transactions.map((tx) {
          return Card(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      border: Border.all(color: Colors.blue, width: 3)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    NumberFormat.simpleCurrency(locale: 'pa', decimalDigits: 2)
                        .format(tx.amount),
                    style: const TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
