// viewmodels/note_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';
import '../services/firestore_service.dart';

class NoteViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  // Fetch notes from Firestore
  Stream<List<Note>> fetchNotes() {
    return _firestoreService.getNotes();
  }

  // Add a new note
  Future<void> addNote(String title, String content) async {
    final newNote = Note(
      title: title,
      content: content,
      createdAt: Timestamp.now(),
      // Make sure you're passing an id if it's required in your Firestore model
      id: '', // This should be updated later when you get the document ID
    );
    await _firestoreService.addNote(newNote);
    notifyListeners(); // Update the UI after adding a new note
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    if (id.isNotEmpty) {
      await _firestoreService.deleteNote(id);
      notifyListeners(); // Update the UI after deleting a note
    } else {
      // Handle the case where the ID is empty (perhaps log an error)
    }
  }
}
