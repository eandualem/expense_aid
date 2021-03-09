import 'package:expense_aid/ui/views/home/user_transaction.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Aid"),
      ),
      body: Column(
        children: [
          Container(
            child: Card(
              child: Text("CARD"),
              elevation: 5,
            ),
            width: double.infinity,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}
