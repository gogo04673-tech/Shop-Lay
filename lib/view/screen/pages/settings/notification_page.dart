import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoplay/controller/controller_pages/notification_controller.dart';
import 'package:shoplay/view/widget/notification_widget/switch_notification.dart';

import 'package:shoplay/view/widget/settings_widget/custom_text_s.dart';

import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Notification"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: GetBuilder<NotificationControllerImp>(
            builder: (controller) => ListView(
              children: [
                // * This is a title Updates
                const CustomTextS(title: "Order Updates"),

                // * This is Switch Row order status
                SwitchNotification(
                  title: "Order Status",
                  description: "Get notified when your order status\nchange.",
                  valueSwitch: controller.orderStatus,
                  onChanged: controller.activeOrderStatus,
                ),
                // * This is Switch Row order status

                // * This is Switch Row Delivery Updates
                SwitchNotification(
                  title: "Delivery Updates",
                  description: "Receive updates on delivery progress.",
                  valueSwitch: controller.deliveryUpdates,
                  onChanged: controller.activeDeliveryUpdates,
                ),

                // * This is a title Promotions
                const CustomTextS(title: "Promotions"),

                // * This is Switch Row Sales Alerts
                SwitchNotification(
                  title: "Sales Alerts",
                  description: "Be the first to know about new sales.",
                  valueSwitch: controller.salesAlerts,
                  onChanged: controller.activeSalesAlerts,
                ),

                // * This is a title Promotions
                const CustomTextS(title: "Restock Alerts"),

                // * This is Switch Row Back in Stock
                SwitchNotification(
                  title: "Back in Stock",
                  description: "Receive alerts when items are\nback in stock.",
                  valueSwitch: controller.backInStock,
                  onChanged: controller.activeBackInStock,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
