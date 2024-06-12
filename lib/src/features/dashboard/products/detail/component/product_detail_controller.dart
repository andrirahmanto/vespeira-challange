import 'package:entrance_test/src/repositories/product_repository.dart';
import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final UserRepository _userRepository;
  final ProductRepository _productRepository;

  ProductDetailController({
    required UserRepository userRepository,
    required ProductRepository productRepository,
  })  : _userRepository = userRepository,
        _productRepository = productRepository;
}
