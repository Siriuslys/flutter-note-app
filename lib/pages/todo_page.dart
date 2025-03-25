import 'package:flutter/material.dart';
import 'package:tugas3/models/todo_model.dart';
import 'package:tugas3/pages/create_todo.dart';
import 'package:tugas3/pages/widgets/todo_card.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  todo: todos[index],
                  index: index,
                  onTodoDeleted: onTodoDeleted,
                  onTodoToggled: onTodoToggled,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateTodo(
                onNewTodoCreated: onNewTodoCreated,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewTodoCreated(Todo todo) {
    todos.add(todo);
    setState(() {});
  }

  void onTodoDeleted(int index) {
    todos.removeAt(index);
    setState(() {});
  }

  void onTodoToggled(int index) {
    setState(() {
      todos[index].isCompleted = !todos[index].isCompleted;
    });
  }
}