import 'package:entrance_test/app/routes/route_name.dart';
import 'package:entrance_test/src/features/dashboard/products/list/component/product_list_controller.dart';
import 'package:entrance_test/src/models/favorite_product_model.dart';
import 'package:entrance_test/src/repositories/favorite_product_repository.dart';
import 'package:get/get.dart';

import '../../../../../models/product_model.dart';
import '../../../../../utils/networking_util.dart';
import '../../../../../widgets/snackbar_widget.dart';

class FavoriteListController extends GetxController {
  final FavoriteProductRepository _favoriteProductRepository;

  FavoriteListController({
    required FavoriteProductRepository favoriteProductRepository,
  }) : _favoriteProductRepository = favoriteProductRepository;

  final _favProducts = Rx<List<FavoriteProductModel>>([]);

  List<FavoriteProductModel> get favProducts => _favProducts.value;

  final _isLoadingRetrieveProduct = false.obs;

  bool get isLoadingRetrieveProduct => _isLoadingRetrieveProduct.value;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  @override
  void onReady() {
    super.onReady();
    getProducts();
  }

  //first load or after refresh.
  Future<void> getProducts() async {
    _isLoadingRetrieveProduct.value = true;
    try {
      final favProducts = _favoriteProductRepository.getProducts();
      _favProducts.value = favProducts;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
    _isLoadingRetrieveProduct.value = false;
  }

  void removeFavoriteProduct(String productId) async {
    try {
      _favoriteProductRepository.deleteProduct(productId);
      await getProducts();
      Get.find<ProductListController>().syncFavoriteProduct();
      SnackbarWidget.showSuccessSnackbar('Product removed from favorite');
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
  }

  void toProductDetail(ProductModel product) async {
    Get.toNamed(RouteName.productDetail, arguments: product.id);
  }
}
