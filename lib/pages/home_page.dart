import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/addtodo_dialog.dart';
import 'package:to_do_app/components/todo_tile.dart';
import 'package:to_do_app/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoModel>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: const AddToDoDialog(),
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
            itemCount: value.todos.length,
            itemBuilder: (context, index) =>
                ToDoTile(value.todos[index], index),
          ),
        ),
      ),
    );
  }
}
