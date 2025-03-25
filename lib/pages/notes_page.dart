import 'package:flutter/material.dart';
import 'package:tugas3/models/note_model.dart';
import 'package:tugas3/pages/create_note.dart';
import 'package:tugas3/pages/home_page.dart';
import 'package:tugas3/pages/widgets/note_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: notes[index],
                  index: index,
                  onNoteDeleted: onNoteDeleted,
                  onNoteEdited: onNoteEdited, 
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateNote(
                onNewNoteCreated: onNewNoteCreated,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onNoteDeleted(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void onNoteEdited(int index, Note newNote) {
    setState(() {
      notes[index] = newNote;
    });
  }
}
