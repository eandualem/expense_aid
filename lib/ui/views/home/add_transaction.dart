import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  AddTransaction(this.addTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final tittleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  submitData() {
    if(amountController.text.isEmpty) return;

    final enteredTitle = tittleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) return;
    return widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate==null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });

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
            Container(
              height: 70,
              child: Row(children: [
                Text(_selectedDate == null ? 'No Date chosen':  DateFormat.yMMMd().format(_selectedDate)),
                TextButton(onPressed: _presentDatePicker , child: Text("Chose date"))
              ],),
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
