
import 'package:flutter/material.dart';
import 'package:q_note/src/constants/colors.dart';
import 'package:q_note/src/features/core/controller/note_controller.dart';
import 'package:q_note/src/features/core/models/notes_model.dart';

class CustomDialogBox {

  static Future<dynamic> buildShowNoteDeleteAdaptiveDialog(BuildContext context, AsyncSnapshot<List<NoteModel>> snapshot, int index) {
    return showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.warning, size: 50.0, color: kPrimaryColor,),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                  'Do you want to delete this note?',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center),
            ),
            content: Text(
              'Are you sure you want to delete this note? If you delete this note, you will not be able to recover it.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  NoteController.instance
                      .deleteNoteFromFirestore(snapshot.data![index].id!);
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        });
  }
}