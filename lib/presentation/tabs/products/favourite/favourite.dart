import 'package:exam3/data/local_data/db/cached_allProducts.dart';
import 'package:exam3/presentation/tabs/products/favourite/widgets_favourite.dart';
import 'package:flutter/material.dart';

import '../../../../data/local_data/db/local_database.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late List<CachedFavourite> cachedProduct;



  Future<List<CachedFavourite>> init() async {
    return await  LocalDatabase.getAllCachedFavourite();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          TextButton(onPressed: () async{
           await LocalDatabase.deleteAllCachedFavourite();
           setState((){});

          }, child:Text("Clear All", style: TextStyle(color: Colors.red),))
        ],
        title: Text("Favourite screen"),
      ),
      body: FutureBuilder(
        future: init(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CachedFavourite>> snapshot) {
          if (snapshot.hasData) {
            List<CachedFavourite> data=snapshot.data!;
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
              children: List.generate(
                  data.length,
                  (index) {
                    var item= data[index];
                    return FavouriteItemView(item: item, onTap: (){}
                    );

                  }
              ),
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
