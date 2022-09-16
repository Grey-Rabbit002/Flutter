import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime? selectedDate = DateTime.parse('0000-00-00');
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addtx(enteredTitle, enteredAmount, selectedDate);
    }
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickeddate) {
      setState(() {
        selectedDate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Item Title'),
            controller: titleController,
            onSubmitted: (_) => submitData,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Item Amount",
            ),
            controller: amountController,
            onSubmitted: (_) => submitData,
          ),
          Container(
            height: 70,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedDate == DateTime.parse('0000-00-00')
                      ? 'No date choosen'
                      : 'Picked Date : ${DateFormat.yMMM().format(selectedDate!)}   '),
                  ElevatedButton(
                    onPressed: presentDatePicker,
                    child: const Text(
                      "choose date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: submitData, child: const Text("Add Transaction")),
        ],
      ),
    );
  }
}
