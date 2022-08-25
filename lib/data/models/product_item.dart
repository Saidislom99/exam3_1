import 'package:json_annotation/json_annotation.dart';


// {
// "id":1,
// "category_id":1,
// "name":"Macbook",
// "price":1200,
// "image_url":"https://e7.pngegg.com/pngimages/765/477/png-clipart-macbook-macbook.png"
// },
// {





part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: 0, name: 'category_id')
  int categoryId;

  @JsonKey(defaultValue: 0, name: 'price')
  int price;


  @JsonKey(defaultValue: '', name: 'name')
  String name;

  @JsonKey(defaultValue: '', name: 'image_url')
  String imageUrl;



  ProductItem({
   required this.imageUrl,
    required this.name,
    required this.id,
    required this.categoryId,
    required this.price
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}




