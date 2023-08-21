import 'package:get/get.dart';
import 'package:q_note/src/features/authentication/screens/welcome_screen/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get to => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 5));
    //Get.offAll(() => const WelcomeScreen());
  }
}