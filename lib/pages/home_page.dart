import 'package:flutter/material.dart';
import 'package:to_do_app/components/addtodo_dialog.dart';
import 'package:to_do_app/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todos = [
    'Make Tutorial',
    'Finish Todo App',
  ];

  void addToDo(String newToDo) {
    setState(() {
      todos.add(newToDo);
    });
  }

  void deleteToDo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToDoDialog(addToDo),
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(child: Text('TO DO')),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 30.0);
          },
          itemCount: todos.length,
          itemBuilder: (context, index) =>
              ToDoTile(todos[index], index, deleteToDo),
        ),
      ),
    );
  }
}
