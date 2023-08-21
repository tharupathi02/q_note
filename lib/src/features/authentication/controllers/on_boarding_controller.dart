import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:q_note/src/constants/colors.dart';
import 'package:q_note/src/constants/image_strings.dart';
import 'package:q_note/src/constants/text_strings.dart';
import 'package:q_note/src/features/authentication/models/on_boarding_model.dart';
import 'package:q_note/src/features/authentication/screens/login/login_screen.dart';
import 'package:q_note/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final liquidController = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    const OnBoardingPageWidget(
      model: OnBoardingModel(
          image: kOnboardingScreen1,
          title: kOnboardingScreen1Title,
          subtitle: kOnboardingScreen1Subtitle,
          counterText: kOnboardingScreenCount1,
          bgColor: kOnboardingPage1Color),
    ),
    const OnBoardingPageWidget(
      model: OnBoardingModel(
          image: kOnboardingScreen2,
          title: kOnboardingScreen2Title,
          subtitle: kOnboardingScreen2Subtitle,
          counterText: kOnboardingScreenCount2,
          bgColor: kOnboardingPage2Color),
    ),
    const OnBoardingPageWidget(
      model: OnBoardingModel(
          image: kOnboardingScreen3,
          title: kOnboardingScreen3Title,
          subtitle: kOnboardingScreen3Subtitle,
          counterText: kOnboardingScreenCount3,
          bgColor: kOnboardingPage3Color),
    ),
  ];

  void onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
    if (currentPage.value == 2) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const LoginScreen());
      });
    }
  }

  animateToNextSlide() {
    int nextPage = liquidController.currentPage + 1;
    liquidController.animateToPage(page: nextPage);
  }
}