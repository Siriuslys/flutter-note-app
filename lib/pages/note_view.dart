import 'package:flutter/material.dart';
import 'package:tugas3/models/note_model.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note, required this.index, required this.onNoteDeleted});

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note view"),
        actions: [
          IconButton(
          onPressed: (){
            showDialog(
              context: context, 
              builder: (context){
                return AlertDialog(
                  title: const Text("Are you sure?"),
                  content: Text("Note ${note.title} will be deleted permanently"),

                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                      onNoteDeleted(index);
                      Navigator.of(context).pop();
                    }, 
                    child: Text("Delete")),

                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: Text("Cancel")),
                  ],
                );
              }
            );
          }, 
          icon: Icon(Icons.delete))
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10,),

            Text(
              note.body,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

          ],
        ),
      )
    );
  }
}