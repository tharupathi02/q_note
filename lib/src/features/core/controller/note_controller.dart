import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/features/core/models/notes_model.dart';
import 'package:q_note/src/features/core/screens/dashboard/dashboard.dart';
import 'package:q_note/src/repository/authentication_repository/authentication_repository.dart';
import 'package:q_note/src/repository/note_repository/note_repository.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';

class NoteController extends GetxController {
  static NoteController get instance => Get.find();

  final title = TextEditingController();
  final content = TextEditingController();
  final searchController = TextEditingController();

  final noteRepo = Get.put(NoteRepository());
  final _authRepo = Get.put(AuthenticationRepository());

  Future<void> createNewNote(NoteModel note) async {
    await noteRepo.createNewNote(note);
    Get.offAll(() => const Dashboard());
  }

  getNotes() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return noteRepo.getAllNotesFromFirestore(email);
    } else {
      CustomSnackBarWidget.showGetSnackBar('Error getting notes', 'Login to continue');
    }
  }

  getAllNote() {
    final email = _authRepo.firebaseUser.value?.email;
    return noteRepo.getAllNotesFromFirestore(email.toString());
  }

  updateNote(NoteModel noteModel) async {
    await noteRepo.updateNoteInFirestore(noteModel);
    Get.offAll(() => const Dashboard());
  }

  deleteNoteFromFirestore(String id) async {
    await noteRepo.deleteNoteFromFirestore(id);
    Get.offAll(() => const Dashboard());
  }

}