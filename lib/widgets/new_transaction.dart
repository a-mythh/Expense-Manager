import "package:flutter/material.dart";
import "package:intl/intl.dart";

class NewTransaction extends StatefulWidget {
  final Function addUserTransaction;

  const NewTransaction(this.addUserTransaction, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitTransaction() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;

    widget.addUserTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
                floatingLabelStyle: Theme.of(context).textTheme.headline3,
                labelStyle: const TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: "Quicksand",
                ),
              ),
              // onChanged: (text) => titleInput = text,
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
                floatingLabelStyle: Theme.of(context).textTheme.headline3,
                labelStyle: const TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: "Quicksand",
                ),
              ),
              // onChanged: (text) { amountInput = text; },
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
            ),
            Container(
              height: 100,
              child: Row(children: [
                Text(_selectedDate == null
                    ? "No Date Chosen"
                    : DateFormat.yMMMd().format(_selectedDate)),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: const Text(
                    "Choose Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            ElevatedButton(
              onPressed: _submitTransaction,
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Text(
                "Add transaction",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
