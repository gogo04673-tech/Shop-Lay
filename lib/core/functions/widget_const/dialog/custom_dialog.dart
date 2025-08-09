import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoplay/core/constant/imageassets.dart';

customDialog(
  String title,
  String body, {
  void Function()? onTapCancel,
  void Function()? onTapOkay,
}) {
  Get.dialog(
    useSafeArea: true,
    transitionDuration: Duration(seconds: 1),

    Stack(
      children: [
        Material(
          color: Colors.transparent,
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 300, horizontal: 40),
              padding: const EdgeInsets.all(10),
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  const SizedBox(height: 28),
                  // * This is Title Dialog.
                  Text(
                    title.capitalizeFirst!,
                    style: TextStyle(
                      color: title.toLowerCase() == "error"
                          ? Colors.red
                          : title.toLowerCase() == "success"
                          ? Colors.green
                          : title.toLowerCase() == "info"
                          ? Colors.blue
                          : Colors.black,
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // * This Description Dialog.
                  Text(
                    body.capitalizeFirst!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 10),

                  // * Button is here
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: onTapCancel,
                          child: Container(
                            width: 100,
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onTapOkay,
                          child: Container(
                            width: 100,
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "Okay",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // * This is Circle Avatar is about image json
        Positioned(
          top: 90,
          left: Get.width / 3.1,
          height: Get.height / 2,
          child: statusImage(title.toLowerCase()),
        ),
      ],
    ),
  );
}

statusImage(String title) {
  return title == "error"
      ? Lottie.asset(AppImageAssets.errorDImage, width: 140)
      : title == "info"
      ? Lottie.asset(AppImageAssets.infoImage, width: 140)
      : title == "success"
      ? Lottie.asset(AppImageAssets.successImage, width: 140)
      : Lottie.asset(AppImageAssets.successImage, width: 140);
}
