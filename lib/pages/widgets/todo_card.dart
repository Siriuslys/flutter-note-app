import 'package:flutter/material.dart';
import 'package:tugas3/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final int index;
  final Function(int) onTodoDeleted;
  final Function(int) onTodoToggled;

  const TodoCard({
    super.key,
    required this.todo,
    required this.index,
    required this.onTodoDeleted,
    required this.onTodoToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (_) => onTodoToggled(index),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted 
              ? TextDecoration.lineThrough 
              : null,
            color: todo.isCompleted 
              ? Colors.grey 
              : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => onTodoDeleted(index),
        ),
      ),
    );
  }
}