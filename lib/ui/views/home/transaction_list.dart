import 'package:expense_aid/core/models/transaction.dart';
import 'package:expense_aid/ui/views/home/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return this._transactions.isEmpty ?
    LayoutBuilder(builder: (context, constraints){
      return Column(
        children: [
          Text("No transaction added yet!"),
          SizedBox(height: 30,),
          Container(
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
            height: constraints.maxHeight*.7,
          ),],
      );
    }) :
    ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          return TransactionItem(transaction: _transactions[index], deleteTransaction: _deleteTransaction);
        }
    );
  }
}

