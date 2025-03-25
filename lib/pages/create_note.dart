import 'package:flutter/material.dart';
import 'package:tugas3/models/note_model.dart';

class CreateNote extends StatefulWidget {
  final Function(Note)? onNewNoteCreated;
  final Function(int, Note)? onNoteEdited;
  final Note? note;
  final int? index;

  const CreateNote({
    super.key,
    this.onNewNoteCreated,
    this.onNoteEdited,
    this.note,
    this.index,
  });

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      bodyController.text = widget.note!.body;
    }
  }

  void saveNote() {
    Note newNote = Note(
      title: titleController.text,
      body: bodyController.text,
    );

    if (widget.note == null) {
      widget.onNewNoteCreated?.call(newNote);
    } else {
      widget.onNoteEdited?.call(widget.index!, newNote);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "Create Note" : "Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: "body"),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveNote,
              child: Text(widget.note == null ? "Save Note" : "Update Note"),
            ),
          ],
        ),
      ),
    );
  }
}
