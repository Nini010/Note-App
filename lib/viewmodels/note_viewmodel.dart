import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/firestore_service.dart';

class NoteViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void fetchNotes() {
    _firestoreService.getNotes().listen((noteList) {
      _notes = noteList;
      notifyListeners();
    });
  }

  void addNote(Note note) async {
    await _firestoreService.addNote(note);
  }

  void updateNote(Note note) async {
    await _firestoreService.updateNote(note);
  }

  void deleteNote(String noteId) async {
    await _firestoreService.deleteNote(noteId);
  }
}
