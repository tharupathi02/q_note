import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    required this.image,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(image), height: MediaQuery.of(context).size.height * 0.2,),
        Text(title, style: Theme.of(context).textTheme.displayLarge,),
        Text(subTitle, style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}