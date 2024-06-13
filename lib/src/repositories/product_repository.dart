import 'package:dio/dio.dart';
import 'package:entrance_test/app/routes/route_name.dart';
import 'package:entrance_test/src/models/response/rating_list_response_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/endpoint.dart';
import '../constants/local_data_key.dart';
import '../models/request/product_list_request_model.dart';
import '../models/response/product_list_response_model.dart';
import '../models/response/product_detail_response_model.dart';
import '../utils/networking_util.dart';

class ProductRepository {
  final Dio _client;
  final GetStorage _local;

  ProductRepository({required Dio client, required GetStorage local})
      : _client = client,
        _local = local {
    _client.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            _local.remove(LocalDataKey.token);
            Get.offAllNamed(RouteName.login);
            return;
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<ProductListResponseModel> getProductList(
      ProductListRequestModel request) async {
    try {
      String endpoint = Endpoint.getProductList;
      final responseJson = await _client.get(
        endpoint,
        data: request,
        options: NetworkingUtil.setupNetworkOptions(
            'Bearer ${_local.read(LocalDataKey.token)}'),
      );
      return ProductListResponseModel.fromJson(responseJson.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<ProductDetailResponseModel> getProductDetail(String productId) async {
    try {
      String endpoint = Endpoint.getProductById(productId);
      final responseJson = await _client.get(
        endpoint,
        options: NetworkingUtil.setupNetworkOptions(
            'Bearer ${_local.read(LocalDataKey.token)}'),
      );
      return ProductDetailResponseModel.fromJson(responseJson.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<RatingListResponseModel> getRatingListByProduct(
      String productId) async {
    try {
      String endpoint = Endpoint.getRatings(productId: productId);
      final responseJson = await _client.get(
        endpoint,
        options: NetworkingUtil.setupNetworkOptions(
            'Bearer ${_local.read(LocalDataKey.token)}'),
      );
      return RatingListResponseModel.fromJson(responseJson.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
