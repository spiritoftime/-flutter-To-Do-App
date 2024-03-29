import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo_model.dart';

class ToDoTile extends StatefulWidget {
  final String todo;
  final int todoIndex;
  const ToDoTile(this.todo, this.todoIndex, {super.key});
  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  bool _isChecked = false;

  void toggleChecked(bool? checked) {
    setState(() {
      _isChecked = checked!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoModel>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow,
        ),
        child: Row(children: [
          Checkbox(value: _isChecked, onChanged: toggleChecked),
          Text(
            widget.todo,
            style: TextStyle(
                decoration: _isChecked ? TextDecoration.lineThrough : null),
          ),
          const Spacer(),
          IconButton(
            onPressed: () =>
                context.read<ToDoModel>().deleteToDo(widget.todoIndex),
            icon: const Icon(Icons.delete, color: Colors.red),
          )
        ]),
      ),
    );
  }
}
