import 'package:exam3/data/local_data/db/cached_category.dart';
import 'package:exam3/data/my_repository.dart';
import 'package:exam3/utils/colors.dart';
import 'package:exam3/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../data/local_data/db/local_database.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.myRepository}) : super(key: key);

  final MyRepository myRepository;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {



  late List<CachedProduct> cachedProduct;

  Future<List<CachedProduct>> init() async {
  return await LocalDatabase.getAllCachedProduct();
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
        title: const Text("Savatcha"),
        actions: [
          TextButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                          "Rostdan ham savatchadi barcha mahsulotlarni o'chirmoqchimisiz?"),
                      actions: [
                        TextButton(
                          child: const Text('Ha'),
                          onPressed: () async {
                           await LocalDatabase.deleteAllCachedProduct();
                           init();
                           setState((){});


                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("Yo'q"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Text(
              "Tozalash",
              style: MyTextStyle.interSemiBold600.copyWith(
                color: MyColors.white,
              ),
            ),
          )
        ],
      ),

      //TODO 10 FutureBuilder widgetidan foydalanib saqlangan mahsulotlar chaqirib ekranga chizilsin!
      //TODO 15 Har bir savatga saqlangan mahsulotni foydalanuvchi o'chirish imkoniga ega bo'lsin!
      //TODO 16 Savatga saqlangan mahsulotlarni umumiy narxini ekranga chiqaring!
      body: FutureBuilder(
        future: init(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CachedProduct>> snapshot) {
          if (snapshot.hasData) {
            var data =snapshot.data!;


            return ListView(
              children: List.generate(data.length, (index) => Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                color: Color(0xFFE5E5E5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(data[index].name),
                        const SizedBox(height: 10,),
                        Text("Mahsulotlar soni:")

                      ],
                    ),
                   Image.network(data[index].imageUrl, width: 70, ) ,
                    IconButton(onPressed: ()async{
                      await LocalDatabase.deleteCachedProductById(data[index].id!);
                      init();
                      setState((){});
                    }, icon: Icon(Icons.delete, color: Colors.red, size: 30,))
                  ],
                ),
              ) ),
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
      )
    );
  }
}
