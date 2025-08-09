import 'package:flutter/material.dart';
import 'package:shoplay/view/widget/home_widget/custom_appbar.dart';
import 'package:shoplay/view/widget/home_widget/custom_categories.dart';
import 'package:shoplay/view/widget/home_widget/custom_search.dart';
import 'package:shoplay/view/widget/home_widget/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List typeProducts = [
      "All",
      "Electronic",
      "Clothing",
      "Home",
      "Games",
      "Food",
      "Cook",
    ];

    return Scaffold(
      // This is AppBar Home Page
      appBar: CustomAppbar(
        title: 'Shop-Lay',
        iconLeading: Icons.notifications_none_outlined,
        iconAction: Icons.shopping_cart_outlined,
      ),

      // This is body Home Page
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // * This is TextField Search about products.
            CustomSearch(),

            // * This Row of type products ( All Clothing .......)
            CustomCategories(typeProducts: typeProducts),

            // * This is a Text title Feature Products
            CustomText(text: "Featured Products"),
          ],
        ),
      ),
    );
  }
}
