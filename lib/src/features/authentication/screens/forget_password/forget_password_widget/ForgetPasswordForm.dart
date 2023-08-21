import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(kForgetPasswordTitle, style: Theme.of(context).textTheme.displaySmall,),
        Text(kForgetPasswordSubTitle, style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: 20.0,),
        Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    labelText: kForgetPasswordSendEmail,
                    hintText: kForgetPasswordSendEmail,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const OTPScreen());
                  },
                  child: Text(kForgetPasswordSendEmail.toUpperCase()),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
