import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.iconLeading,

    this.onTapList,
  });
  final String title;
  final IconData iconLeading;

  final void Function()? onTapList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapList,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontSize: 16)),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(iconLeading),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
