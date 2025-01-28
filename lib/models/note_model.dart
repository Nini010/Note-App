// models/note_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String id;
  final String title;
  final String content;
  final Timestamp createdAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // Convert Firestore document to Note object
  factory Note.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Note(
      id: doc.id, // Get the document ID
      title: data['title'],
      content: data['content'],
      createdAt: data['createdAt'],
    );
  }

  // Convert Note object to a map to store in Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }
}
