import 'package:exam3/data/local_data/db/cached_allProducts.dart';
import 'package:exam3/data/models/product_item.dart';
import 'package:exam3/presentation/tabs/products/all_products/widget_all_products.dart';
import 'package:flutter/material.dart';

import '../../../../data/local_data/db/cached_category.dart';
import '../../../../data/local_data/db/local_database.dart';
import '../../../../data/my_repository.dart';
import '../../../../utils/utility_functions.dart';
import '../favourite/favourite.dart';

class Products extends StatefulWidget {
  const Products({Key? key, required this.myRepository}) : super(key: key);

  final MyRepository myRepository;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  late List<CachedFavourite> favourites;

  Future<List<CachedFavourite>> init() async {
    return await LocalDatabase.getAllCachedFavourite();
  }

  @override
  void initState() {
    init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hamma mahsulotlar"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext c){
              return Favourite();
            }));
          }, icon: Icon(Icons.favorite, size: 30, color: Colors.black,))
        ],
      ),
      body: FutureBuilder(
        future: widget.myRepository.getAllProduct(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductItem>> snapshot) {
          if (snapshot.hasData) {
            var data =snapshot.data!;


            return GridView.count(
                crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6,
            children: List.generate(data.length, (index) => AllProductItemView(
              onTap: () async{
                await LocalDatabase.insertCachedFavourite(
                    CachedFavourite(
                        imageUrl: data[index].imageUrl,
                        price: data[index].price,
                        name: data[index].name,
                        productId: data[index].id));
                setState(() {});
                UtilityFunctions.getMyToast(
                    message:
                    "Sevimlilarga qo'shildi");

              },
              item: data[index],)),
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
