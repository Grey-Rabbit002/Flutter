import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transactions.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get groupedRecentTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; ++i) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedRecentTransactions.fold(0.0, (sum, element) {
      return (sum + (element['amount'] as double));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedRecentTransactions.map((data) {
            return Flexible(
              fit: FlexFit.loose,
              child: chartBar(
                label: data['day'].toString(),
                spentAmount: data['amount'] as double,
                totalPctSpent: maxSpending == 0
                    ? 0.0
                    : ((data['amount'] as double) / maxSpending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
