import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/core/functions/translate_data_base.dart';
import 'package:shoplay/data/models/item_m.dart';

class CustomListItemHor extends StatelessWidget {
  const CustomListItemHor({super.key, required this.list});
  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Item(itemModel: ItemModel.fromJson(list[i]));
        },
      ),
    );
  }
}

class Item extends StatelessWidget {
  final ItemModel itemModel;
  const Item({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: "${AppLinks.itemImage}/${itemModel.itemsImage!}",
            width: 205,
          ),
          const SizedBox(height: 8),
          Text(
            translateDataBase(itemModel.itemsNameAr!, itemModel.itemsName!),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            "\$${itemModel.itemsPrice!}",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: const Color.fromARGB(255, 214, 216, 218),
            ),
          ),
        ],
      ),
    );
  }
}
