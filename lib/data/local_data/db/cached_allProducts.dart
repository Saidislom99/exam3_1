const String favouriteTable = "cached_favourite";

class FavouriteFields {
  static final List<String> values = [

    id, productId,name, price, imageUrl,
  ];
  static const String id = "_id";
  static const String productId = "product_id";
  static const String name = "name";
  static const String price = "price";
  static const String imageUrl = "image_url";
}

class CachedFavourite {
  final int? id;
  final int productId;
  final String name;
  final int price;
  final String imageUrl;

  CachedFavourite({
    this.id,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.productId,
  });

  CachedFavourite copyWith({
    int? id,
    int? productId,
    int? price,
    String? name,
    String? imageUrl,
  }) =>
      CachedFavourite(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        price: price ?? this.price,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  static CachedFavourite fromJson(Map<String, Object?> json) => CachedFavourite(
    id: json[FavouriteFields.id] as int?,
    productId: json[FavouriteFields.productId] as int,
    price: json[FavouriteFields.price] as int,
    name: json[FavouriteFields.name] as String,
    imageUrl: json[FavouriteFields.imageUrl] as String,
  );

  Map<String, Object?> toJson() => {
    FavouriteFields.id: id,
    FavouriteFields.productId: productId,
    FavouriteFields.price: price,
    FavouriteFields.name: name,
    FavouriteFields.imageUrl: imageUrl,
  };

  @override
  String toString() => '''
        ID: $id 
        PRODUCT ID $productId
        PRICE $price
        NAME $name
        IMAGE URL $imageUrl
      ''';
}
