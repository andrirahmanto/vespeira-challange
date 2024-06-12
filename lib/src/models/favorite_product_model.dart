import 'package:entrance_test/src/models/favorite_product_image_model.dart';
import 'package:realm/realm.dart';

part 'favorite_product_model.realm.dart';

@RealmModel()
class _FavoriteProductModel {
  @PrimaryKey()
  late final String id;
  late final String name;
  late final int price;
  late final int discountPrice;
  late final List<$FavoriteProductImageModel> images;
  late final String? description;
  late final String? returnTerms;
  late final String? ratingAverage;
  late final int? ratingCount;
  late final int? reviewCount;
}
