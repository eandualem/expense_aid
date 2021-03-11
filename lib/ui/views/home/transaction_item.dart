import 'dart:math';

import 'package:expense_aid/core/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required Transaction transaction,
    @required Function deleteTransaction,
  }) : _transaction = transaction, _deleteTransaction = deleteTransaction, super(key: key);

  final Transaction _transaction;
  final Function _deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;
  @override
  void initState() {
    const availableColors = [Colors.red, Colors.blue, Colors.orange, Colors.purple, Colors.greenAccent];
    _bgColor = availableColors[Random().nextInt(5)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text("${widget._transaction.amount.toStringAsFixed(2)} Birr")),
          ),
        ),
        title: Text(widget._transaction.title),
        subtitle: Text( DateFormat.yMMMd().format(widget._transaction.date),
          style: TextStyle(
              color: Colors.grey
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => widget._deleteTransaction(widget._transaction.id),
        ),
      ),
    );
  }
}
