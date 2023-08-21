import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:q_note/src/constants/firebase_const.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/models/user_model.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection(kFirebaseFirestoreUsersCollection)
        .add(user.toJson())
        .whenComplete(() => CustomSnackBarWidget.showGetSnackBar('Congratulations!', 'You are successfully registered in $kAppName app, and you can now write your notes freely, and store them in the cloud.',))
        .catchError((error, snackTrace) {
          CustomSnackBarWidget.showGetSnackBar('Error occurred!', 'An error occurred while registering your account, please try again later.');
        });
  }
}
