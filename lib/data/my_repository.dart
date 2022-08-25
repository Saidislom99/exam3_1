

import 'package:exam3/data/api/api_provider.dart';
import 'package:exam3/data/local_data/db/cached_category.dart';
import 'package:exam3/data/models/category_item.dart';
import 'package:exam3/data/models/product_item.dart';

import 'local_data/db/local_database.dart';

class MyRepository {
  MyRepository({
    required this.apiProvider,
  });

  final ApiProvider apiProvider;



  //TODO 6 apiProvider klasi ichidagi metodlar chaqirib MyRepository klasi obyektiga qo'shilsin!

//  -----------------------------------Products------------------------------------------


  Future<List<CategoryItem>> getAllCategory() => apiProvider.getAllCategory();

  Future<List<ProductItem>> getAllProduct() => apiProvider.getAllProducts();


  Future<List<ProductItem>> getSingleCategoryProducts(int categoryId) =>
      apiProvider.getSingleCategory(categoryId: categoryId);




 //TODO 7 Lokal databasega klasi ichidagi metodlar chaqirib MyRepository klasi obyektiga qo'shilsin!

  static Future<CachedProduct> insertCachedProduct(
      {required CachedProduct cachedProduct}) async {
    return await LocalDatabase.insertCacheProduct(cachedProduct);
  }

  static Future<int> getSingleProductById({required int id}) async {
    return await LocalDatabase.deleteCachedProductById(id);
  }

  static Future<List<CachedProduct>> getAllCachedProduct() async {
    return await LocalDatabase.getAllCachedProduct();
  }
  //
  // static Future<List<CachedProduct>> deleteAllProduct() async{
  //   return await LocalDatabase.deleteAllCachedProduct();
  // }



}
