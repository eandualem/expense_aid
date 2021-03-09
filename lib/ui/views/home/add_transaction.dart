import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final tittleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  AddTransaction(this.addTransaction);

  submitData() {

    final enteredTitle = tittleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) return;
    return addTransaction(enteredTitle, enteredAmount);
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: tittleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text("Add Transaction",),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }

}
