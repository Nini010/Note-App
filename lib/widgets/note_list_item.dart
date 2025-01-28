// widgets/note_list_item.dart
import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../viewmodels/note_viewmodel.dart';
import 'package:provider/provider.dart';

class NoteListItem extends StatelessWidget {
  final Note note;

  const NoteListItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.content),
      onTap: () {
        // Navigate to the edit screen (if you have one)
        Navigator.pushNamed(context, '/edit', arguments: note);
      },
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // Delete the note
          Provider.of<NoteViewModel>(context, listen: false)
              .deleteNote(note.id);
        },
      ),
    );
  }
}
