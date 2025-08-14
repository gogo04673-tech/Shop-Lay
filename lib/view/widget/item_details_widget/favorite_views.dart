import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

class FavoriteViews extends StatelessWidget {
  const FavoriteViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Text value
            const Text(
              "4.5",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            // * Star or value
            Row(
              children: [
                ...List.generate(
                  5,
                  (i) => const Icon(Icons.star_border_outlined),
                ),
              ],
            ),

            // * Text Views
            Text(
              "${125} Reviews",
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColor.greyDeep),
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...List.generate(5, (i) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Text(
                      "${i + 1}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      width: 180,
                      child: LinearProgressIndicator(
                        color: AppColor.primaryColor,
                        backgroundColor: AppColor.grey,
                        borderRadius: BorderRadius.circular(10),
                        minHeight: 10,
                        value: .2,
                      ),
                    ),

                    // Value of %
                    const Text(
                      "20%",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
