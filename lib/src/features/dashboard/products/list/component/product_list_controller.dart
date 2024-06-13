import 'package:entrance_test/app/routes/route_name.dart';
import 'package:entrance_test/src/features/dashboard/favorites/list/component/favorite_list_controller.dart';
import 'package:entrance_test/src/repositories/favorite_product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/product_model.dart';
import '../../../../../models/request/product_list_request_model.dart';
import '../../../../../repositories/product_repository.dart';
import '../../../../../utils/networking_util.dart';
import '../../../../../widgets/snackbar_widget.dart';

class ProductListController extends GetxController {
  final ProductRepository _productRepository;
  final FavoriteProductRepository _favProductRepository;

  ProductListController({
    required ProductRepository productRepository,
    required FavoriteProductRepository favProductRepository,
  })  : _productRepository = productRepository,
        _favProductRepository = favProductRepository;

  final _products = Rx<List<ProductModel>>([]);

  List<ProductModel> get products => _products.value;

  final _isLoadingRetrieveProduct = false.obs;

  bool get isLoadingRetrieveProduct => _isLoadingRetrieveProduct.value;

  final _isLoadingRetrieveMoreProduct = false.obs;

  bool get isLoadingRetrieveMoreProduct => _isLoadingRetrieveMoreProduct.value;

  final _isLoadingRetrieveCategory = false.obs;

  bool get isLoadingRetrieveCategory => _isLoadingRetrieveCategory.value;

  final _canFilterCategory = true.obs;

  bool get canFilterCategory => _canFilterCategory.value;

  final _isLastPageProduct = false.obs;

  //The number of product retrieved each time a call is made to server
  final _limit = 10;

  //The number which shows how many product already loaded to the device,
  //thus giving the command to ignore the first x number of data when retrieving
  int _skip = 0;

  final scrollController = ScrollController();

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreProducts();
      }
    });
    await getProducts();
    syncFavoriteProduct();
  }

  //first load or after refresh.
  Future<void> getProducts() async {
    _isLoadingRetrieveProduct.value = true;
    _skip = 0;
    try {
      final productList =
          await _productRepository.getProductList(ProductListRequestModel(
        limit: _limit,
        skip: _skip,
      ));
      _products.value = productList.data;
      _products.refresh();
      _isLastPageProduct.value = productList.data.length < _limit;
      _skip = products.length;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
    _isLoadingRetrieveProduct.value = false;
  }

  void getMoreProducts() async {
    if (_isLastPageProduct.value || _isLoadingRetrieveMoreProduct.value) return;
    _isLoadingRetrieveMoreProduct.value = true;
    try {
      final productList =
          await _productRepository.getProductList(ProductListRequestModel(
        limit: _limit,
        skip: _skip,
      ));
      _products.value.addAll(productList.data);
      _products.refresh();
      _isLastPageProduct.value = productList.data.length < _limit;
      _skip = products.length;
      syncFavoriteProduct();
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }

    _isLoadingRetrieveMoreProduct.value = false;
  }

  void toProductDetail(ProductModel product) async {
    Get.toNamed(RouteName.productDetail, arguments: product.id);
  }

  void syncFavoriteProduct() {
    List<String> listIdFavorite = _favProductRepository.getFavoritesId();
    for (ProductModel product in products) {
      product.isFavorite = listIdFavorite.contains(product.id);
    }
  }

  void setFavorite(ProductModel product) {
    if (product.isFavorite) {
      _favProductRepository.deleteProduct(product.id);
      Get.find<FavoriteListController>().getProducts();
    } else {
      _favProductRepository.saveProduct(product);
      Get.find<FavoriteListController>().getProducts();
    }
    syncFavoriteProduct();
  }
}
