import 'package:flutter/material.dart';
import 'package:q_note/src/constants/image_strings.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/login/login_screen.dart';


class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
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
            label: Text(kSignUpScreenSignUpGoogle, style: Theme.of(context).textTheme.bodyLarge,),
          ),
        ),
        const SizedBox(height: 20.0,),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: Text.rich(
              TextSpan(
                  text: kSignUpScreenHaveAccount,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const [
                    TextSpan(
                      text: ' $kLoginText',
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