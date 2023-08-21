import 'package:flutter/material.dart';
import 'package:q_note/src/constants/image_strings.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:q_note/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:q_note/src/widgets/form_header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultSizes),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderWidget(
                image: kLoginScreenImage,
                title: kLoginScreenTitle,
                subTitle: kLoginScreenSubTitle,
              ),
              LoginForm(),
              LoginFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
