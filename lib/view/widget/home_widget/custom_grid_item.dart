import 'package:flutter/widgets.dart';
import 'package:shoplay/core/constant/links/links_server.dart';
import 'package:shoplay/data/models/item_m.dart';

class CustomGridItem extends StatelessWidget {
  final List list;
  const CustomGridItem({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: .8,

          // crossAxisSpacing: 20,
        ),
        itemCount: list.length,
        itemBuilder: (context, i) {
          return AllItem(itemModel: ItemModel.fromJson(list[i]));
        },
      ),
    );
  }
}

class AllItem extends StatelessWidget {
  final ItemModel itemModel;
  const AllItem({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.network(
            "${AppLinks.itemImage}/${itemModel.itemsImage!}",
            width: 150,
            height: 150,
          ),
          SizedBox(height: 7),
          Text(itemModel.itemsName!),
        ],
      ),
    );
  }
}
