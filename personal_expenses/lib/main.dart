import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transactions.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/newTransaction.dart';
import 'package:personal_expenses/widgets/transactionList.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.teal),
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
    // Transaction(id: "1", title: "Item 1", amount: 20.00, date: DateTime.now()),
    // Transaction(id: "2", title: "Item 2", amount: 30.00, date: DateTime.now()),
    // Transaction(id: "3", title: "Item 3", amount: 30.00, date: DateTime.now()),
    // Transaction(id: "4", title: "Item 4", amount: 40.00, date: DateTime.now())
  ];
  List<Transaction> get recentTransaction {
    return userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  bool showChart = false;

  void adduserTransaction(
      String txtitle, double txamount, DateTime chosenDate) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: chosenDate);
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

  void deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((element) => element.id == id);
    });
  }

  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final isLandscape = mediaquery.orientation == Orientation.landscape;
    final appbar = AppBar(
      title: const Text("Personal Expenses"),
      actions: [
        IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: const Icon(Icons.add))
      ],
    );
    final txListWidget = Container(
        height: (mediaquery.size.height -
                appbar.preferredSize.height -
                mediaquery.padding.top) *
            0.5,
        child: TransactionList(userTransactions, deleteTransaction));

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Show Chart"),
                    Switch(
                        value: showChart,
                        onChanged: (val) {
                          setState(() {
                            showChart = val;
                          });
                        }),
                  ],
                ),
              if (!isLandscape)
                Container(
                  height: (mediaquery.size.height -
                          appbar.preferredSize.height -
                          mediaquery.padding.top) *
                      0.3,
                  child: Chart(
                    (recentTransaction),
                  ),
                ),
              if (!isLandscape) txListWidget,
              if (isLandscape)
                showChart
                    ? Container(
                        height: (mediaquery.size.height -
                                appbar.preferredSize.height -
                                mediaquery.padding.top) *
                            0.7,
                        child: Chart(
                          (recentTransaction),
                        ),
                      )
                    : txListWidget,
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
