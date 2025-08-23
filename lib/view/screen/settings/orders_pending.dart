import 'package:flutter/material.dart';
import 'package:shoplay/controller/controller_pages/orders_pending_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';
import 'package:shoplay/view/widget/orders_widget/name_page_change.dart';
import 'package:shoplay/view/widget/orders_widget/order_view.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';
import 'package:get/get.dart';

class OrdersPendingPage extends StatelessWidget {
  const OrdersPendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingControllerImp());
    return Scaffold(
      appBar: const CustomAppbar(title: "Orders"),
      body: GetBuilder<OrdersPendingControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                // * Pages All Pending Completed
                NamePageAndChange(controller: controller),

                // Custom Grid View to order
                controller.indexPage == 0
                    ? Expanded(
                        child: CustomOrderView(
                          controller: controller,
                          list: controller.orders,
                        ),
                      )
                    : controller.indexPage == 1
                    ? Expanded(
                        child: CustomOrderView(
                          controller: controller,
                          list: controller.ordersPending,
                        ),
                      )
                    : Expanded(
                        child: CustomOrderView(
                          controller: controller,
                          list: controller.ordersCompleted,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
