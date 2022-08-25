import 'package:json_annotation/json_annotation.dart';

// {
// "id":1,
// "name":"Computers",
// "image_url":"https://www.microsoft.com/en-us/microsoft-365/blog/wp-content/uploads/sites/2/2020/05/Dell-1.png"
// },
//






part 'category_item.g.dart';

@JsonSerializable()
class CategoryItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'name')
  String name;

  @JsonKey(defaultValue: '', name: 'image_url')
  String imageUrl;




  CategoryItem({
    required this.id,
    required this.name,
    required this.imageUrl,

  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}





