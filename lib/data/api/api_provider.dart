import 'dart:convert';
import 'package:exam3/data/models/category_item.dart';
import 'package:exam3/data/models/product_item.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as h;
import 'package:http/http.dart';


class ApiProvider {

  // ------------------------- Get All Categories -----------------------------

  ///GET ALL COMPANIES
  Future<List<CategoryItem>> getAllCategory() async {
    try {
      Response response =
      await h.get(Uri.parse("https://third-exam.free.mockoapp.net/categories"));
      if (response.statusCode == 200) {
        List<CategoryItem> categoryItem = (jsonDecode(response.body) as List?)
            ?.map((e) => CategoryItem.fromJson(e))
            .toList() ??
            [];
        return categoryItem;
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future <List<CategoryItem>> getAllAnimation() async{
    try{
      Response response= await h.get(Uri.parse(""));
      if(response.statusCode==200){
        List<CategoryItem> category=(jsonDecode(response.body) as List?)
            ?.map((e) => CategoryItem.fromJson(e))
            .toList() ?? [];
        return category;
      } else {
        throw Exception();
      }
    }catch (error){
      throw Exception(error);
    }
  }

  /// GET SINGLE COMPANY


  // ------------------------- Get Single Category Products -----------------------------
  Future<List<ProductItem>> getSingleCategory({required int categoryId}) async {
    try {
      Response response = await h
          .get(Uri.parse("https://third-exam.free.mockoapp.net/categories/$categoryId"));
      if (response.statusCode == 200) {

        List<ProductItem> products = (jsonDecode(response.body) as List?)
            ?.map((e) => ProductItem.fromJson(e))
            .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }


  // ------------------Get Products-------------------------


  Future<List<ProductItem>> getAllProducts() async {
    try {
      Response response =
      await h.get(Uri.parse("https://third-exam.free.mockoapp.net/products"));
      if (response.statusCode == 200) {
        List<ProductItem> productAll = (jsonDecode(response.body) as List?)
            ?.map((e) => ProductItem.fromJson(e))
            .toList() ??
            [];
        return productAll;
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception(error);
    }
  }

}
