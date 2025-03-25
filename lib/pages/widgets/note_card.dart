import 'package:flutter/material.dart';
import 'package:tugas3/models/note_model.dart';
import 'package:tugas3/pages/create_note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;
  final Function(int) onNoteDeleted;
  final Function(int, Note) onNoteEdited; 

  const NoteCard({
    super.key,
    required this.note,
    required this.index,
    required this.onNoteDeleted,
    required this.onNoteEdited,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.body),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateNote(
                      note: note,
                      index: index,
                      onNoteEdited: onNoteEdited,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onNoteDeleted(index),
            ),
          ],
        ),
      ),
    );
  }
}
