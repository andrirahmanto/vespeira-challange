import 'package:entrance_test/src/models/favorite_product_image_model.dart';
import 'package:entrance_test/src/models/favorite_product_model.dart';
import 'package:entrance_test/src/models/product_model.dart';
import 'package:realm/realm.dart';

class FavoriteProductRepository {
  final Realm _realm;

  FavoriteProductRepository({required Realm realm}) : _realm = realm;

  Future<void> saveProduct(ProductModel product) async {
    final List<FavoriteProductImageModel> favProductImage =
        product.images!.isEmpty
            ? []
            : product.images!
                .map((e) => FavoriteProductImageModel(
                      e.id,
                      e.productId,
                      path: e.path,
                      pathSmall: e.pathSmall,
                      url: e.url,
                      urlSmall: e.urlSmall,
                      createdAt: e.createdAt,
                      updatedAt: e.updatedAt,
                    ))
                .toList();
    final favProdcut = FavoriteProductModel(
      product.id,
      product.name,
      product.price,
      product.discountPrice,
      description: product.description,
      returnTerms: product.returnTerms,
      ratingAverage: product.ratingAverage,
      ratingCount: product.ratingCount,
      reviewCount: product.reviewCount,
      images: favProductImage,
    );
    _realm.write(
      () {
        _realm.add(favProdcut);
      },
    );
  }

  Future<void> deleteProduct(String id) async {
    _realm.write(
      () {
        final product = _realm.find<FavoriteProductModel>(id);
        if (product != null) {
          _realm.delete(product);
        }
      },
    );
  }

  void deleteAllProducts() {
    _realm.write(() {
      _realm.deleteAll<FavoriteProductModel>();
    });
  }

  List<FavoriteProductModel> getProducts() {
    return _realm.all<FavoriteProductModel>().toList();
  }

  List<String> getFavoritesId() {
    return _realm.all<FavoriteProductModel>().map((e) => e.id).toList();
  }
}
