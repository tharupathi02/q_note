import 'package:flutter/material.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/features/authentication/screens/forget_password/forget_password_widget/ForgetPasswordForm.dart';

class ForgetPasswordBottomSheet {

  static Future buildShowModelBottomSheetForgetPassword(BuildContext context) {
    return showModalBottomSheet(
        elevation: 10.0,
        enableDrag: true,
        context: context,
        builder: (context) => Container(
          width: double.infinity,
          padding: const EdgeInsets.all(kDefaultSizes),
          child: const ForgetPasswordWidget(),
        )
    );
  }

}