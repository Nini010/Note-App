import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_taking_app/models/note_model.dart';

class FirestoreService {
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(Note note) async {
    await _notesCollection.doc(note.id).set(note.toFirestore());
  }

  Future<void> updateNote(Note note) async {
    await _notesCollection.doc(note.id).update(note.toFirestore());
  }

  Future<void> deleteNote(String noteId) async {
    await _notesCollection.doc(noteId).delete();
  }

  Stream<List<Note>> getNotes() {
    return _notesCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Note.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}
