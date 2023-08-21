import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance.signInWithEmailAndPassword(email, password);
  }

}