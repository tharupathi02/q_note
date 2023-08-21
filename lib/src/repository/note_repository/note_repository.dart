import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:q_note/src/constants/firebase_const.dart';
import 'package:q_note/src/features/core/models/notes_model.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';

class NoteRepository extends GetxController {
  static NoteRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createNewNote(NoteModel nodeModel) async {
    await _db.collection(kFirebaseFirestoreNotesCollection)
        .add(nodeModel.toJson())
        .whenComplete(() => CustomSnackBarWidget.showGetSnackBar('New Note Created Successfully', 'New note created successfully and stored in the cloud.',))
        .catchError((error, snackTrace) {
          CustomSnackBarWidget.showGetSnackBar('Error occurred!', 'An error occurred while creating new note, please try again later.');
        });
  }

  Future<List<NoteModel>> getAllNotesFromFirestore(String email) async {
    final snapshot = await _db.collection(kFirebaseFirestoreNotesCollection).where('Email', isEqualTo: email).get();
    final noteData = snapshot.docs.map((e) => NoteModel.fromJson(e)).toList();
    return noteData.reversed.toList();
  }

  Future<void> updateNoteInFirestore(NoteModel noteModel) async {
    await _db.collection(kFirebaseFirestoreNotesCollection).doc(noteModel.id).update(noteModel.toJson())
        .whenComplete(() => CustomSnackBarWidget.showGetSnackBar('Note Updated Successfully', 'Note updated successfully and stored in the cloud.',))
        .catchError((error, snackTrace) {
          CustomSnackBarWidget.showGetSnackBar('Error occurred!', 'An error occurred while updating note, please try again later.');
        });
  }

  // Delete note from firestore
  Future<void> deleteNoteFromFirestore(String id) async {
    await _db.collection(kFirebaseFirestoreNotesCollection).doc(id).delete()
        .whenComplete(() => CustomSnackBarWidget.showGetSnackBar('Note Deleted Successfully', 'Note deleted successfully and removed from the cloud.',))
        .catchError((error, snackTrace) {
          CustomSnackBarWidget.showGetSnackBar('Error occurred!', 'An error occurred while deleting note, please try again later.');
        });
  }

}