import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shoplay/controller/controller_pages/notifications_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/data/models/notify_m.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Notifications"),
      body: GetBuilder<NotificationsControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: controller.notifyList.length,
            itemBuilder: (context, i) {
              NotifyModel notify = controller.notifyList[i];
              return ListTile(
                title: Text(
                  notify.notificationsTitle!,
                  style: const TextStyle(height: 1),
                ),
                subtitle: Text(notify.notificationsBody!),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.grey,
                  ),
                  child: const Icon(Icons.notifications_none_rounded),
                ),
                trailing: Text(
                  Jiffy.parse(
                    Jiffy.parse(
                      notify.notificationsDate!,
                      pattern: "yyyy-MM-dd HH:mm:ss",
                    ).format(pattern: "yyyy/MM/dd"),
                  ).fromNow(),
                  style: const TextStyle(
                    color: AppColor.thirdColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
