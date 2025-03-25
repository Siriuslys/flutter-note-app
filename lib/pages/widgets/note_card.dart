import 'package:flutter/material.dart';
import 'package:tugas3/models/note_model.dart';
import 'package:tugas3/pages/create_note.dart';
import 'package:tugas3/pages/note_view.dart';

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
      child: InkWell(
        onTap: () => _navigateToNoteView(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNoteTitle(),
              const SizedBox(height: 10),
              _buildNoteBody(),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoteTitle() {
    return Text(
      note.title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildNoteBody() {
    return Text(
      note.body,
      style: const TextStyle(
        fontSize: 16,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _navigateToEditNote(context),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => onNoteDeleted(index),
        ),
      ],
    );
  }

  void _navigateToNoteView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteView(
          note: note,
          index: index,
          onNoteDeleted: onNoteDeleted,
        ),
      ),
    );
  }

  void _navigateToEditNote(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateNote(
          note: note,
          index: index,
          onNoteEdited: onNoteEdited,
        ),
      ),
    );
  }
}