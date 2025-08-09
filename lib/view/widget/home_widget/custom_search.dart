import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: "Search products",
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(fontSize: 14, color: AppColor.greyDeep),
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: AppColor.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
