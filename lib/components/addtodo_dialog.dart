import 'package:flutter/material.dart';

class AddToDoDialog extends StatelessWidget {
  const AddToDoDialog(
    this.addToDo, {
    super.key,
  });
  final Function(String) addToDo;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add To Do',
      onPressed: () => _dialogBuilder(context, addToDo),
      child: const Icon(Icons.add),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context, addToDo) {
  TextEditingController toDoController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add A New To Do!'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: toDoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.yellow)),
              hintText: 'Enter your todo here',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Type the todo in the text field below, click save. if you wish to exit, click cancel',
          ),
        ]),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Save'),
            onPressed: () {
              addToDo(toDoController.text);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
