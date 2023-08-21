import 'package:flutter/material.dart';
import 'package:q_note/src/constants/image_strings.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/signup/sign_up_footer_widget.dart';
import 'package:q_note/src/features/authentication/screens/signup/sign_up_form_widget.dart';
import 'package:q_note/src/widgets/form_header_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultSizes),
          child: const Column(
            children: [
              FormHeaderWidget(
                image: kLoginScreenImage,
                title: kSignUpScreenTitle,
                subTitle: kSignUpScreenSubTitle,
              ),
              SignUpFormWidget(),
              SignUpFooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


