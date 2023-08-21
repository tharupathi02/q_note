import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/controllers/signup_controller.dart';
import 'package:q_note/src/features/authentication/models/user_model.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  late bool _passwordVisible;
  late bool _confirmPasswordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: kEmail,
                prefixIcon: Icon(Icons.alternate_email_rounded),
              ),
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                labelText: kPassword,
                prefixIcon: const Icon(Icons.fingerprint_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off,),
                ),
              ),
              obscureText: !_passwordVisible,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              controller: controller.confirmPassword,
              decoration: InputDecoration(
                labelText: kConfirmPassword,
                prefixIcon: const Icon(Icons.fingerprint_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                  icon: Icon(_confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,),
                ),
              ),
              obscureText: !_confirmPasswordVisible,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 20.0,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.password.text.trim() != controller.confirmPassword.text.trim()) {
                    CustomSnackBarWidget.showGetSnackBar('Error', 'Password and Confirm Password do not match.');
                    return;
                  } else if (formKey.currentState!.validate()) {
                    final user = UserModel(
                      emailAddress: controller.email.text.trim(),
                      password: controller.password.text.trim()
                    );
                    SignUpController.instance.createUser(user);
                  } else {
                    CustomSnackBarWidget.showGetSnackBar('Error', 'Please enter valid email and password.');
                  }
                },
                child: Text(kSignUpText.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}