import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/core/controller/note_controller.dart';
import 'package:q_note/src/features/core/models/notes_model.dart';
import 'package:q_note/src/features/core/screens/new_note/new_note_screen.dart';
import 'package:q_note/src/repository/authentication_repository/authentication_repository.dart';
import 'package:q_note/src/widgets/dialog_box_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final controller = Get.put(NoteController());
  final _authRepo = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(kAppName),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                AuthenticationRepository.instance.signOut();
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '$kDashboardScreenTitle ${_authRepo.firebaseUser.value!.displayName.toString()}',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(kDashboardScreenSubTitle,
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: FutureBuilder<List<NoteModel>>(
                      future: controller.getAllNote(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => NewNote(
                                        status: 'Edit',
                                        note: snapshot.data![index],
                                      ),
                                    );
                                  },
                                  onLongPress: () {
                                    CustomDialogBox.buildShowNoteDeleteAdaptiveDialog(context, snapshot, index);
                                  },
                                  child: Card(
                                    elevation: 5.0,
                                    child: Container(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            snapshot.data![index].description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            maxLines: 5,
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              DateFormat(
                                                      'MMMM dd, yyyy\nhh:mm a')
                                                  .format(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          int.parse(snapshot
                                                              .data![index]
                                                              .date)))
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            );
                          } else {
                            return Center(
                              child: Text(
                                'No notes found',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => NewNote(
                status: 'New',
                note: NoteModel(
                  title: '',
                  description: '',
                  date: '',
                  time: '',
                  email: '',
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
