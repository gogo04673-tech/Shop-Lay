import 'package:flutter/material.dart';
import 'package:shoplay/view/widget/tool/custom_search.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.iconLeading,
    this.iconAction,
    this.onPressedLeading,
    this.onPressedAction,
  });

  final String? title;
  final IconData? iconLeading;
  final IconData? iconAction;
  final void Function()? onPressedLeading;
  final void Function()? onPressedAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : const CustomSearch(),
      // * This is leading Button
      leading: iconLeading == null
          ? null
          : IconButton(onPressed: onPressedLeading, icon: Icon(iconLeading)),
      // * This Action Button
      actions: iconAction == null
          ? null
          : [
              IconButton(
                onPressed: onPressedAction,
                icon: Icon(iconAction),
                iconSize: 30,
              ),
              const SizedBox(width: 5),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
