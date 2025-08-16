import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/profile_controller.dart';
import 'package:shoplay/view/widget/settings_widget/custom_list_tile.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp cont = Get.put(ProfileControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Profile"),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          // * This is a photo profile
          const CircleAvatar(radius: 50),

          // * This is username and image
          Center(
            child: Text(
              "${cont.username}",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
            child: Text(
              "${cont.email}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),

          GetBuilder<ProfileControllerImp>(
            builder: (controller) {
              return Column(
                children: List.generate(
                  controller.itemsProfile.length,
                  (i) => CustomListTile(
                    title: controller.itemsProfile[i]['name'],
                    iconLeading: controller.itemsProfile[i]['leading'],
                    onTapList: controller.itemsProfile[i]['function'],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
