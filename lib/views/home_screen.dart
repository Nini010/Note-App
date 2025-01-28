// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/note_viewmodel.dart';
import '../widgets/note_list_item.dart';
import '../models/note_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for changes in the notes
    final noteViewModel = Provider.of<NoteViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Note>>(
        stream: noteViewModel.fetchNotes(), // Fetch notes from Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final notes = snapshot.data ?? [];
          if (notes.isEmpty) {
            return const Center(child: Text("No notes found."));
          }

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteListItem(note: notes[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
              context, '/add'); // Navigate to the Add Note screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
