import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transactions.dart';
import 'package:personal_expenses/widgets/newTransaction.dart';
import 'package:personal_expenses/widgets/transactionList.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransactions = [
    Transaction(id: "1", title: "Item 1", amount: 20.00, date: DateTime.now()),
    Transaction(id: "2", title: "Item 2", amount: 30.00, date: DateTime.now()),
    Transaction(id: "3", title: "Item 3", amount: 30.00, date: DateTime.now()),
    Transaction(id: "4", title: "Item 4", amount: 40.00, date: DateTime.now())
  ];

  void adduserTransaction(String txtitle, double txamount) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());

    setState(() {
      userTransactions.add(newtx);
    });
  }

  @override
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return (NewTransaction(adduserTransaction));
        });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Personal Expenses"),
          actions: [
            IconButton(
                onPressed: () {
                  startAddNewTransaction(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: const Text("Manage your expenses here"),
              ),
              TransactionList(userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          },
        ),
      ),
    );
  }
}
