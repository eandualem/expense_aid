import 'package:expense_aid/core/models/transaction.dart';
import 'package:expense_aid/ui/views/home/add_transaction.dart';
import 'package:expense_aid/ui/views/home/chart.dart';
import 'package:expense_aid/ui/views/home/transaction_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (_) {
      return AddTransaction(_addTransaction);
    });
  }

  final List<Transaction> _userTransactions = [
    // Transaction(id: "T1", title: "New Shoes", amount: 1200, date: DateTime.now()),
    // Transaction(id: "T2", title: "Cocacola", amount: 20, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate);

    setState(() {
      _userTransactions.add(newTx);
      Navigator.of(context).pop(); //???
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
          DateTime.now().subtract(
              Duration(days: 7)
          )
      );
    }).toList();
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }
  bool _showChart = false;

  @override
  Widget build(BuildContext context) {

    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text("Expense Aid"),
      actions: [
        IconButton(
          icon: Icon(Icons.add, color: Colors.white,),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );



    var freeSpace = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;
    final txListWidget =  Container(
        height: freeSpace * 0.70,
        child: TransactionList(_userTransactions, _deleteTransaction)
    );

    final txCardWidget = Container(
        height: freeSpace * 0.30,
        child: Chart(_recentTransactions)
    );

    final txCardWidgetLand = Container(
        height: freeSpace * 0.70,
        child: Chart(_recentTransactions)
    );

    List<Widget> _buildLandscapeContent(){
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Show Chart"),
            Switch(
                value: _showChart,
                onChanged: (val){
                  setState(() {
                    _showChart= val;
                  });
                })
          ],),
        _showChart
            ? txCardWidgetLand
            : txListWidget,
      ];
    }
    List<Widget> _buildPortraitContent(){
      return[
        txCardWidget,
        txListWidget,];
    }

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(isLandscape) ..._buildLandscapeContent(),
            if(!isLandscape) ..._buildPortraitContent()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
