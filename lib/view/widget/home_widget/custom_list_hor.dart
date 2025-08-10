import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
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
      margin: EdgeInsets.only(right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "${AppLinks.itemImage}/${itemModel.itemsImage!}",
            width: 205,
          ),
          SizedBox(height: 8),
          Text(
            itemModel.itemsName!,
            style: TextStyle(fontWeight: FontWeight.w600),
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
