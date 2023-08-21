import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/features/core/controller/note_controller.dart';
import 'package:q_note/src/features/core/models/notes_model.dart';
import 'package:q_note/src/repository/authentication_repository/authentication_repository.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key, required this.status, this.note});

  final String status;
  final NoteModel? note;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());
    final formKey = GlobalKey<FormState>();
    final authRepo = Get.put(AuthenticationRepository());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultSizes - 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              widget.note!.description.isEmpty
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${widget.note!.description.length} Characters',
                            ),
                            const Text(
                              ' | ',
                            ),
                            Text(
                              '${widget.note!.description.split(' ').length} Words',
                            ),
                          ],
                        ),
                        Text(
                          DateFormat('MMMM dd, yyyy | hh:mm a').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(widget.note!.date))),
                        ),
                      ],
                    ),
              TextFormField(
                controller:
                    widget.status == 'New' ? controller.title : controller.title
                      ..text = widget.note!.title,
                style: GoogleFonts.poppins(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Note Title here...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              TextFormField(
                controller: widget.status == 'New'
                    ? controller.content
                    : controller.content
                  ..text = widget.note!.description,
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Write Your Story here...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.status == 'New') {
            if (controller.title.text.isEmpty) {
              CustomSnackBarWidget.showGetSnackBar(
                  'Error', 'Note title is empty. Please fill it.');
              return;
            } else if (controller.content.text.isEmpty) {
              CustomSnackBarWidget.showGetSnackBar(
                  'Error', 'Note content is empty. Please fill it.');
              return;
            } else {
              final note = NoteModel(
                title: controller.title.text,
                description: controller.content.text,
                date: DateTime.now().millisecondsSinceEpoch.toString(),
                time: DateTime.now().millisecondsSinceEpoch.toString(),
                email: authRepo.firebaseUser.value!.email.toString(),
              );
              NoteController.instance.createNewNote(note);
            }
          } else if (widget.status == "Edit") {
            if (controller.title.text.isEmpty) {
              CustomSnackBarWidget.showGetSnackBar(
                  'Error', 'Note title is empty. Please fill it.');
              return;
            } else if (controller.content.text.isEmpty) {
              CustomSnackBarWidget.showGetSnackBar(
                  'Error', 'Note content is empty. Please fill it.');
              return;
            } else {
              final note = NoteModel(
                id: widget.note!.id,
                title: controller.title.text,
                description: controller.content.text,
                date: DateTime.now().millisecondsSinceEpoch.toString(),
                time: DateTime.now().millisecondsSinceEpoch.toString(),
                email: authRepo.firebaseUser.value!.email.toString(),
              );
              NoteController.instance.updateNote(note);
            }
          }
        },
        child: widget.status == 'New' ? const Icon(Icons.add) : const Icon(Icons.update),
      ),
    );
  }
}
