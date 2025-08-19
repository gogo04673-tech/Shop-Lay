import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/core/functions/translate_data_base.dart';
import 'package:shoplay/data/models/item_m.dart';
import 'package:shoplay/view/widget/tool/custom_text.dart';

class ListItemSearch extends StatelessWidget {
  const ListItemSearch({super.key, required this.list});
  final List<ItemModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const CustomText(text: "Popular Searches"),

        // * Grid View about item Search
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: list.length,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * image item
                Hero(
                  tag: "${list[i].itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: "${AppLinks.itemImage}/${list[i].itemsImage}",
                    width: 170,
                    height: 170,
                  ),
                ),

                const SizedBox(height: 8),
                Text(
                  translateDataBase(list[i].itemsNameAr!, list[i].itemsName!),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,

                    height: 1,
                  ),
                ),
                Text(
                  "\$${list[i].itemsPrice!}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: const Color.fromARGB(255, 214, 216, 218),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
