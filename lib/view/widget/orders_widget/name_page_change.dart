import 'package:flutter/material.dart';
import 'package:shoplay/controller/controller_pages/orders_pending_controller.dart';
import 'package:shoplay/core/constant/colors.dart';

class NamePageAndChange extends StatelessWidget {
  const NamePageAndChange({super.key, required this.controller});
  final OrdersPendingControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(controller.pageOrders.length, (i) {
          Map pageMap = controller.pageOrders[i];
          return InkWell(
            onTap: () {
              controller.changePageOrders(pageMap['index']);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.only(right: 30),
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: controller.indexPage == i
                    ? const Border(
                        bottom: BorderSide(
                          color: AppColor.primaryColor,
                          width: 1.5,
                        ),
                      )
                    : null,
              ),
              child: Text(
                pageMap['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: controller.indexPage == i
                      ? AppColor.primaryColor
                      : AppColor.thirdColor,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
