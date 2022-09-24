import 'package:flutter/material.dart';

class chartBar extends StatelessWidget {
  final String label;
  final double spentAmount;
  final double totalPctSpent;
  chartBar(
      {required this.label,
      required this.spentAmount,
      required this.totalPctSpent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
                height: constraints.maxHeight * 0.10,
                child: FittedBox(child: Text(spentAmount.toStringAsFixed(1)))),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.7,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 20),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: totalPctSpent,
                    child: Container(
                        decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 20),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
                height: constraints.maxHeight * 0.10,
                child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
