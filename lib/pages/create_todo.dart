import 'package:flutter/material.dart';
import 'package:tugas3/models/todo_model.dart';

class CreateTodo extends StatefulWidget {
  final Function(Todo) onNewTodoCreated;

  const CreateTodo({
    super.key, 
    required this.onNewTodoCreated,
  });

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter todo title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  final todo = Todo(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: _titleController.text,
                  );
                  widget.onNewTodoCreated(todo);
                  Navigator.pop(context);
                }
              },
              child: const Text('Create Todo'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}