import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:q_note/src/constants/colors.dart';
import 'package:q_note/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: onBoardingController.pages,
            liquidController: onBoardingController.liquidController,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: onBoardingController.onPageChangeCallback,
          ),
          Obx(
            () => Positioned(
              bottom: 30,
              child: AnimatedSmoothIndicator(
                activeIndex: onBoardingController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: kDarkColor,
                  dotHeight: 5.0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
