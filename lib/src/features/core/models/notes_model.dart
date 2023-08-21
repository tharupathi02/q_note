import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String? id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String email;

  NoteModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.email,
  });

  toJson() {
    return {
      'Title': title,
      'Description': description,
      'Date': date,
      'Time': time,
      'Email': email,
    };
  }

  factory NoteModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return NoteModel(
      id: document.id,
      title: data!['Title'],
      description: data['Description'],
      date: data['Date'],
      time: data['Time'],
      email: data['Email'],
    );
  }
}