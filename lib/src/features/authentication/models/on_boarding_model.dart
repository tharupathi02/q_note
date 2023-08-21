import 'package:flutter/cupertino.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subtitle;
  final String counterText;
  final Color bgColor;

  const OnBoardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.counterText,
    required this.bgColor,
  });
}