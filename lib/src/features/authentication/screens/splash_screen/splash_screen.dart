import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:q_note/firebase_options.dart';
import 'package:q_note/src/constants/colors.dart';
import 'package:q_note/src/constants/image_strings.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:q_note/src/repository/authentication_repository/authentication_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              top: -30,
              left: -30,
              child: Image(
                image: AssetImage(kSplashScreenIcon),
                width: 150.0,
                height: 150.0,
              ),
            ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 80,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kAppName,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    kAppTagLine,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          const AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              top: 200,
              right: 30,
              child: Image(
                image: AssetImage(kSplashScreenIcon),
                width: 400.0,
                height: 400.0,
              ),
            ),
          const AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              bottom: 180,
              left: 20,
              child: Image(
                image: AssetImage(kSplashScreenImage),
                width: 400.0,
                height: 400.0,
              ),
            ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              bottom: 40,
              right: kDefaultSizes,
              child: Container(
                width: kSplashContainerSize,
                height: kSplashContainerSize,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.white,
                  size: kSplashContainerSize,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
