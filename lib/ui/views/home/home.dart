import 'package:expense_aid/core/models/transaction.dart';
import 'package:expense_aid/ui/views/home/add_transaction.dart';
import 'package:expense_aid/ui/views/home/chart.dart';
import 'package:expense_aid/ui/views/home/transaction_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (_) {
      return AddTransaction(_addTransaction);
    });
  }

  final List<Transaction> _userTransactions = [
    // Transaction(id: "T1", title: "New Shoes", amount: 1200, date: DateTime.now()),
    // Transaction(id: "T2", title: "Cocacola", amount: 20, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
      Navigator.of(context).pop();
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
          DateTime.now().subtract(
              Duration(days: 7)
          )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Aid"),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        children: [
         Chart(_recentTransactions),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
