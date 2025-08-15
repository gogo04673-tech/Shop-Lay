import 'package:flutter/material.dart';
import 'package:get/get.dart';

customBottomSheetStatus({
  String title = "Error",
  String subTitle = "Oops! Something went wrong.",
  String textError =
      "We encountered an issue while processing\nyour request. Please try again.",
}) {
  Get.bottomSheet(
    Container(
      color: Colors.white,
      height: 200,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 40,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 125),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.clear),
              ),
            ],
          ),

          ListTile(
            title: Text(subTitle),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.highlight_remove_sharp),
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            child: Text(textError),
          ),
        ],
      ),
    ),
  );
}
