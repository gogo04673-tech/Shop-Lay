import 'package:flutter/material.dart';
import 'package:shoplay/controller/controller_pages/orders_pending_controller.dart';
import 'package:shoplay/core/constant/colors.dart';
import 'package:shoplay/data/models/order_m.dart';

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
        childAspectRatio: 2,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) {
        OrderModel orderModel = list[i];
        return Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColor.secondaryColor, width: 1),
            ),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order ID: ${orderModel.ordersId}",
                    style: const TextStyle(color: AppColor.thirdColor),
                  ),

                  Text(
                    controller.printOrderType(orderModel.ordersType!),
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2 items \$${orderModel.ordersTotalPrice!.toStringAsFixed(2)}",
                    style: const TextStyle(color: AppColor.thirdColor),
                  ),

                  Text(
                    "Status: ${controller.printOrderStatus(orderModel.ordersStatus!)}",
                    style: const TextStyle(color: AppColor.thirdColor),
                  ),

                  Container(
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
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
