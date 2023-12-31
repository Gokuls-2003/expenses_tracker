import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _rigesterExpense = [];
  void _openAddExpenseOverlay() {
     showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
        context: context, builder: (ctx) =>  NewExpense(onAddExpense: _addExpense,));
  }


  void _removeExpense(Expense expense){
    final expenseIndex = _rigesterExpense.indexOf(expense);
    setState(() {
     _rigesterExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      duration:const  Duration(seconds: 3),
      content:  const Text('Expense deleted'),
      action: SnackBarAction(label: "undo", onPressed: (){
          setState(() {
            _rigesterExpense.insert(expenseIndex, expense);
          });
      }),
      ),
   );

  }

  void _addExpense(Expense expense) {
    setState(() {
      _rigesterExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(child: Text("No Expense Found. Start adding some!"),);
    if(_rigesterExpense.isNotEmpty){
      mainContent =  ExpensesList(expenses: _rigesterExpense, onRemoveExpense: _removeExpense,);
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(
            onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
      ]),
      body: width <600 ? Column(
        children: [
          Chart(expenses : _rigesterExpense),
          Expanded(child:mainContent)
        ],
      ) : Row(children: [
         Expanded(child: Chart(expenses : _rigesterExpense)),
          Expanded(child:mainContent)
      ],)
    );
  }
}
