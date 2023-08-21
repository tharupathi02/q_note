import 'package:flutter/material.dart';
import 'package:q_note/src/constants/sizes.dart';
import 'package:q_note/src/features/authentication/models/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(kDefaultSizes),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.4,),
          Column(
            children: [
              Text(model.title, style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 10),
              Text(model.subtitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Text(model.counterText, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 50.0)
        ],
      ),
    );
  }
}