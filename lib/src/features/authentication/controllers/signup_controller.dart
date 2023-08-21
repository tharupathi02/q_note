import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/features/authentication/models/user_model.dart';
import 'package:q_note/src/features/core/screens/dashboard/dashboard.dart';
import 'package:q_note/src/repository/authentication_repository/authentication_repository.dart';
import 'package:q_note/src/repository/user_repository/user_repository.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    emailAuthentication(user.emailAddress, user.password);
    Get.offAll(() => const Dashboard());
  }

  void emailAuthentication(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String;
    if (error.isNotEmpty){
      CustomSnackBarWidget.showGetSnackBar(
        'Error creating account',
        'Error: $error',
      );
    }
  }

}