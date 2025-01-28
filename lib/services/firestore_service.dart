// services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch all notes from Firestore
  Stream<List<Note>> getNotes() {
    return _db.collection('notes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    });
  }

  // Add a note to Firestore
  Future<void> addNote(Note note) async {
    final noteRef = await _db.collection('notes').add(note.toMap());
    // You can handle the generated noteRef.id if needed
  }

  // Delete a note by its ID
  Future<void> deleteNote(String id) async {
    await _db.collection('notes').doc(id).delete();
  }
}
