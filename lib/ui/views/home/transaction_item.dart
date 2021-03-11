import 'package:expense_aid/core/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required Transaction transaction,
    @required Function deleteTransaction,
  }) : _transaction = transaction, _deleteTransaction = deleteTransaction, super(key: key);

  final Transaction _transaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text("${_transaction.amount.toStringAsFixed(2)} Birr")),
          ),
        ),
        title: Text(_transaction.title),
        subtitle: Text( DateFormat.yMMMd().format(_transaction.date),
          style: TextStyle(
              color: Colors.grey
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => _deleteTransaction(_transaction.id),
        ),
      ),
    );
  }
}
