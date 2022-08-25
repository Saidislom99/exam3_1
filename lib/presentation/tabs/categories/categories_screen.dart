import 'package:exam3/data/models/category_item.dart';
import 'package:exam3/data/my_repository.dart';
import 'package:exam3/presentation/tabs/categories/widgets/category_item_view.dart';
import 'package:flutter/material.dart';

import '../../products/products_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key, required this.myRepository})
      : super(key: key);

  final MyRepository myRepository;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategoryalar"),
      ),
      //TODO 8 FutureBuilder widget idan foydalanib barcha kategoriyalar chaqirilib ekranga chizilsin!
      body: FutureBuilder(
        future: widget.myRepository.getAllCategory(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CategoryItem>> snapshot) {
          if (snapshot.hasData) {
            var data =snapshot.data!;

            
            return ListView(
              children: List.generate(data.length, (index) => CategoryItemView(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return ProductsScreen(categoryItem: data[index], myRepository: widget.myRepository,);
                  }));
                },

                categoryItem: data[index],)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),

            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
