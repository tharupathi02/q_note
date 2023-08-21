import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/controllers/login_controller.dart';
import 'package:q_note/src/features/authentication/screens/forget_password/forget_password_widget/forget_password_bottom_sheet.dart';
import 'package:q_note/src/widgets/snack_bar_widget.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();

    return Form(
      child: Container(
        key: formKey,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.alternate_email_outlined),
                labelText: kEmail,
                hintText: kEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: controller.password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint_rounded),
                labelText: kPassword,
                hintText: kPassword,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
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
            const SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordBottomSheet.buildShowModelBottomSheetForgetPassword(
                      context);
                },
                child: const Text(kForgetPassword),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.email.text.isEmpty) {
                    CustomSnackBarWidget.showSnackBar(context, 'Blank Email', 'Please enter your email.', ContentType.warning);
                    return;
                  } else if (controller.password.text.isEmpty) {
                    CustomSnackBarWidget.showSnackBar(context, 'Blank Password', 'Please enter your password.', ContentType.warning);
                    return;
                  } else {
                    LoginController.instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
                  }
                },
                child: Text(kLoginText.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
