import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    required this.onPressedSearch,
    required this.controller,
    required this.onChanged,
  });
  final void Function()? onPressedSearch;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,

      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: "Search products",
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(fontSize: 14, color: AppColor.greyDeep),
        prefixIcon: IconButton(
          onPressed: onPressedSearch,
          icon: const Icon(Icons.search),
        ),
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
