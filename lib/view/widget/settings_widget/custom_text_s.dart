import 'package:flutter/material.dart';

class CustomTextS extends StatelessWidget {
  const CustomTextS({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
