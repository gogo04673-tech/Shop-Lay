import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shoplay/controller/controller_pages/orders_pending_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/data/models/order_m.dart';
import 'package:shoplay/view/widget/orders_widget/dialog_rating.dart';

class CustomOrderView extends StatelessWidget {
  const CustomOrderView({
    super.key,
    required this.controller,
    required this.list,
  });
  final OrdersPendingControllerImp controller;
  final List<OrderModel> list;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.5,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) {
        OrderModel orderModel = list[i];
        return Card(
          color: AppColor.white,
          elevation: 0.5,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColor.secondaryColor, width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextOrder(
                  title: "Order ID",
                  value: "${orderModel.ordersId}",
                ),

                Text(
                  controller.printOrderType(orderModel.ordersType!),
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                CustomTextOrder(
                  title: "Date",
                  value: Jiffy.parse(
                    Jiffy.parse(
                      orderModel.ordersDateTime!,
                      pattern: "yyyy-MM-dd HH:mm:ss",
                    ).format(pattern: "yyyy/MM/dd"),
                  ).fromNow(),
                ),

                const CustomTextOrder(title: "Items", value: "2"),
                CustomTextOrder(
                  title: "Price",
                  value: "\$${orderModel.ordersTotalPrice!.toStringAsFixed(2)}",
                ),

                CustomTextOrder(
                  title: "Status",
                  value: controller.printOrderStatus(orderModel.ordersStatus!),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.goToDetailsOrder(orderModel.ordersId!);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "View Details",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                    orderModel.ordersStatus == 0
                        ? InkWell(
                            onTap: () {
                              controller.orderDeleteRequest(
                                orderModel.ordersId!,
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                "Delete Order",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        : (orderModel.ordersStatus == 4 &&
                              orderModel.ordersRating == 0)
                        ? InkWell(
                            onTap: () {
                              showDialogRating(
                                context,
                                orderModel.ordersId.toString(),
                                controller,
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Text(
                                "Rating",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomTextOrder extends StatelessWidget {
  const CustomTextOrder({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColor.thirdColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

        Text(
          value,
          style: const TextStyle(
            color: AppColor.thirdColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
