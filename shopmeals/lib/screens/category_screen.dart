import 'package:flutter/material.dart';
import 'package:shopmeals/widgets/categoryItem.dart';
import 'package:shopmeals/model/dummyData.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals4U"),
      ),
      body: GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            ...DUMMY_CATEGORIES
                .map((catData) => CategoryItem(
                    id: catData.id, title: catData.title, color: catData.color))
                .toList(),
          ]),
    );
  }
}
