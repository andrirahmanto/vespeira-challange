import 'package:realm/realm.dart';

part 'favorite_product_image_model.realm.dart';

@RealmModel()
class $FavoriteProductImageModel {
  @PrimaryKey()
  late final String id;
  late final String productId;
  late final String? path;
  late final String? pathSmall;
  late final String? url;
  late final String? urlSmall;
  late final String? createdAt;
  late final String? updatedAt;
}
