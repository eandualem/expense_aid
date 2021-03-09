import 'package:expense_aid/core/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> _transactions;
  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    child: Text("${_transactions[index].amount.toString()} Birr",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue
                        )
                    ),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blue,
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
                          child: Text(_transactions[index].date.toString(),
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
