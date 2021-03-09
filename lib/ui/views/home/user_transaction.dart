import 'package:expense_aid/core/models/transaction.dart';
import 'package:expense_aid/ui/views/home/add_transaction.dart';
import 'package:expense_aid/ui/views/home/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "T1", title: "New Shoes", amount: 1200, date: DateTime.now()),
    Transaction(id: "T2", title: "Cocacola", amount: 20, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(_addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
