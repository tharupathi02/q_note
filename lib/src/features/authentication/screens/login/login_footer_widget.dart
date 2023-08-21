import 'package:flutter/material.dart';
import 'package:q_note/src/constants/image_strings.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("OR", style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: 10.0,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(kLoginScreenGoogleLogo), width: 30.0,),
            onPressed: () {},
            label: Text(kLoginScreenSignInGoogle, style: Theme.of(context).textTheme.bodyLarge,),
          ),
        ),
        const SizedBox(height: 20.0,),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: Text.rich(
              TextSpan(
                  text: kLoginScreenDoNotHaveAccount,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const [
                    TextSpan(
                      text: ' $kSignUpText',
                      style: TextStyle(color: Colors.blue),
                    )
                  ]
              )
          ),
        )
      ],
    );
  }
}