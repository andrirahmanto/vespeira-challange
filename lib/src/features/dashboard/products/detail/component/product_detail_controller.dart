import 'dart:developer';

import 'package:entrance_test/src/models/product_model.dart';
import 'package:entrance_test/src/models/rating_model.dart';
import 'package:entrance_test/src/repositories/product_repository.dart';
import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:entrance_test/src/utils/networking_util.dart';
import 'package:entrance_test/src/widgets/snackbar_widget.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final ProductRepository _productRepository;

  final productId = Get.arguments;

  final _ratings = <RatingModel>[].obs;

  List<RatingModel> get ratings => _ratings;

  late Rx<ProductModel> _productDetail;

  ProductModel get productDetail => _productDetail.value;

  final isLoading = false.obs;

  ProductDetailController({
    required UserRepository userRepository,
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  void onInit() async {
    super.onInit();
    await getDetailProduct();
    await getListRating();
    inspect(_productDetail.value);
    inspect(_ratings);
  }

  void setProductDetail(ProductModel product) {
    try {
      _productDetail.value = product;
    } catch (e) {
      _productDetail = Rx<ProductModel>(product);
    }
  }

  Future<void> getDetailProduct() async {
    isLoading.value = true;
    try {
      final response = await _productRepository.getProductDetail(productId);
      setProductDetail(response.data);
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
    isLoading.value = false;
  }

  Future<void> getListRating() async {
    isLoading.value = true;
    try {
      final response =
          await _productRepository.getRatingListByProduct(productId);
      _ratings.value = response.data;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
    isLoading.value = false;
  }

  bool isPriceDiscount() {
    return !(_productDetail.value.discountPrice == _productDetail.value.price);
  }
}
