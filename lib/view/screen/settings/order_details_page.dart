import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoplay/controller/controller_pages/order_details_controller.dart';
import 'package:shoplay/core/class/handling_data_view.dart';

import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/data/models/order_details_m.dart';
import 'package:shoplay/view/widget/order_details_w/text_details_w.dart';
import 'package:shoplay/view/widget/tool/custom_appbar.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsControllerImp cont = Get.put(OrderDetailsControllerImp());
    cont.getOrderDetailsRequest();
    return Scaffold(
      appBar: const CustomAppbar(title: "Order Details"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<OrderDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                if (controller.orderDetails.isNotEmpty)
                  Column(
                    children: [
                      TextDetailsW(
                        title: 'Order number',
                        value: '${controller.cartOrder}',
                      ),
                      TextDetailsW(
                        title: 'Date',
                        value: '${controller.orderDetails[0].ordersDateTime}',
                      ),
                      TextDetailsW(
                        title: 'Items',
                        value: '${controller.orderDetails[0].countItem}',
                      ),
                      TextDetailsW(
                        title: 'Receive',
                        value: controller.orderDetails[0].ordersType == 0
                            ? '${controller.orderDetails[0].addressCity} ${controller.orderDetails[0].addressStreet}'
                            : "In-Stor pickup",
                      ),
                      TextDetailsW(
                        title: 'Total',
                        value:
                            '\$${controller.orderDetails[0].ordersTotalPrice!.toStringAsFixed(2)}',
                      ),
                    ],
                  ),

                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 4.2,
                  ),
                  itemCount: controller.orderDetails.length,
                  itemBuilder: (context, i) {
                    OrderDetailsModel order = controller.orderDetails[i];
                    return ListTile(
                      title: Text("${order.itemsName}"),
                      subtitle: Text(order.itemsDesc!),
                      leading: CachedNetworkImage(
                        imageUrl: "${AppLinks.itemImage}/${order.itemsImage}",
                        width: 60,
                        height: 70,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
