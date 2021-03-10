import 'package:expense_aid/core/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> _transactions;
  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: this._transactions.isEmpty ?
      Column(
        children: [
          Text("No transaction added yet!"),
          SizedBox(height: 30,),
          Container(
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
            height: 300,
          ),],
      ) :
      ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    child: Text("${_transactions[index].amount.toStringAsFixed(2)} Birr",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor
                        )
                    ),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2
                        )
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(_transactions[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        ),
                        Container(
                          child: Text( DateFormat.yMMMd().format(_transactions[index].date),
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
