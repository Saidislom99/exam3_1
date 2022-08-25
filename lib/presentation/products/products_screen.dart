import 'package:exam3/data/local_data/db/cached_category.dart';
import 'package:exam3/data/local_data/db/local_database.dart';
import 'package:exam3/data/models/category_item.dart';
import 'package:exam3/data/models/product_item.dart';
import 'package:exam3/data/my_repository.dart';
import 'package:exam3/presentation/products/widgets/product_item_view.dart';
import 'package:flutter/material.dart';

import '../../utils/utility_functions.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen(
      {Key? key, required this.myRepository, required this.categoryItem})
      : super(key: key);

  final MyRepository myRepository;
  final CategoryItem categoryItem;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
      ),
      //TODO 12 Tegishli kategoriyaga tegishli mahsulotlar ro'yxati GridView shaklida ekranga chizilsin!
      //TODO 13 Mahsulot ustidagi Savatga qo'shish tugmasi bosilganda mahsulotni savatga ya'ni lokal bazaga saqlang!
      //TODO Agar mahsulot oldin saqlangan bo'lsa count maydoni 1 ga oshirilsin va shu mahsulot update qilinsin aks holda jadvalga yangi qo'shilsin!
      //TODO 14 Mahsulot savatga qo'shilgani haqida foydalanuvchiga habar chiqarilsin!
      body: FutureBuilder(
        future: widget.myRepository.getSingleCategoryProducts(widget.categoryItem.id),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductItem>> snapshot) {
          if (snapshot.hasData) {
            var data =snapshot.data!;


            return GridView.count(
                crossAxisCount: 2,
              childAspectRatio: 0.6,
              children: List.generate(data.length, (index) => ProductsItemView(
                item: data[index], onTap: ()async {
              await LocalDatabase.insertCacheProduct(
                  CachedProduct(
                      imageUrl: data[index].imageUrl,
                      price: data[index].price,

                      count: data[index].id,

                      name: data[index].name,
                      productId: data[index].id));
              setState(() {});
              UtilityFunctions.getMyToast(
                  message:
                  "Savatga  qo'shildi");
                
              },)),
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
