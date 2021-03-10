import 'package:expense_aid/core/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(child: Text("${_transactions[index].amount.toStringAsFixed(2)} Birr")),
                ),
              ),
              title: Text(_transactions[index].title),
              subtitle: Text( DateFormat.yMMMd().format(_transactions[index].date),
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => _deleteTransaction(_transactions[index].id),
              ),
            ),
          );
        }
    );
  }
}
