import 'package:exam3/data/local_data/db/cached_allProducts.dart';
import 'package:exam3/data/local_data/db/cached_category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';


class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("todos.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  LocalDatabase._init();

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";
    const doubleType = "REAL DEFAULT 0.0";

    await db.execute('''
    CREATE TABLE $productsTable (
    ${ProductFields.id} $idType,
    ${ProductFields.count} $intType,
    ${ProductFields.productId} $intType,
    ${ProductFields.imageUrl} $textType,
    ${ProductFields.name} $textType,
    ${ProductFields.price} $intType
    )
    ''');

    await db.execute('''
    CREATE TABLE $favouriteTable (
    ${FavouriteFields.id} $idType,
    ${FavouriteFields.productId} $intType,
    ${FavouriteFields.imageUrl} $textType,
    ${FavouriteFields.name} $textType,
    ${FavouriteFields.price} $intType
    )
    ''');
  }

  //-------------------Cached Products Table-------------------


  // Kiritish
  static Future<CachedProduct> insertCacheProduct(CachedProduct cachedProduct)async{
    final db= await getInstance.database;
    final id =await db.insert(productsTable, cachedProduct.toJson());
    return cachedProduct.copyWith(id: id);
  }
// Hamma datani olish
  static Future<List<CachedProduct>> getAllCachedProduct()async{
    final db= await getInstance.database;
    const orderBy= ProductFields.name;
    final result =await db.query(productsTable, orderBy: orderBy);
    return result.map((json) => CachedProduct.fromJson(json)).toList();
  }
// Hammasini o'chirish
  static Future<int> deleteAllCachedProduct() async {
    final db = await getInstance.database;
    return await db.delete(productsTable);
  }
  // Id bo'yich o'chirish
  static Future<int> deleteCachedProductById(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(productsTable, where: "${ProductFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  // Yangilash
  // static Future<int> updateCachedUser(CachedProduct cachedProduct) async {
  //   Map<String, dynamic> row = {
  //     ProductFields.name: cachedProduct.name,
  //     ProductFields.price: cachedProduct.price,
  //   };
  //
  //   final db = await getInstance.database;
  //   return await db.update(
  //     productsTable,
  //     row,
  //     where: '${ProductFields.id} = ?',
  //     whereArgs: [cachedProduct.id],
  //   );
  // }

  // Kiritish
  static Future<CachedFavourite> insertCachedFavourite(CachedFavourite cachedFavourite)async{
    final db= await getInstance.database;
    final id =await db.insert(favouriteTable, cachedFavourite.toJson());
    return cachedFavourite.copyWith(id: id);
  }

// Hamma datani olish
  static Future<List<CachedFavourite>> getAllCachedFavourite()async{
    final db= await getInstance.database;
    const orderBy= FavouriteFields.name;
    final result =await db.query(favouriteTable, orderBy: orderBy);
    return result.map((json) => CachedFavourite.fromJson(json)).toList();
  }
// Hammasini o'chirish
  static Future<int> deleteAllCachedFavourite() async {
    final db = await getInstance.database;
    return await db.delete(favouriteTable);
  }
  // Id bo'yich o'chirish
  static Future<int> deleteCachedFavouriteById(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(favouriteTable, where: "${FavouriteFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

}
