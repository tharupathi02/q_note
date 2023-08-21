import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_note/src/constants/image_strings.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/login/login_screen.dart';
import 'package:q_note/src/features/authentication/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kDefaultSizes),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(kWelcomeScreenImage), height: height * 0.6,),
            Column(
              children: [
                Text(kWelcomeScreenTitle, style: Theme.of(context).textTheme.displayMedium,),
                Text(kWelcomeScreenSubtitle, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: Text(kLoginText.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: Text(kSignUpText.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
