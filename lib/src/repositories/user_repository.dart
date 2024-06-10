import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:entrance_test/src/constants/local_data_key.dart';
import 'package:entrance_test/src/models/response/error_response_model.dart';
import 'package:entrance_test/src/models/response/login_response_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/endpoint.dart';
import '../models/response/user_response_model.dart';
import '../utils/networking_util.dart';

class UserRepository {
  final Dio _client;
  final GetStorage _local;

  UserRepository({required Dio client, required GetStorage local})
      : _client = client,
        _local = local;

  Future<void> login(
      {required String phoneNumber,
      required String password,
      required String countryCode}) async {
    try {
      final response = await _client.post(
        Endpoint.signin,
        data: {
          "phone_number": phoneNumber,
          "password": password,
          "country_code": countryCode,
        },
      );
      final loginResponseModel = LoginResponseModel.fromJson(response.data);
      _local.write(LocalDataKey.token, loginResponseModel.token);
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _client.post(
        Endpoint.signout,
        options: NetworkingUtil.setupNetworkOptions(
            'Bearer ${_local.read(LocalDataKey.token)}'),
      );
      await _local.remove(LocalDataKey.token);
      return;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<UserResponseModel> getUser() async {
    try {
      final responseJson = await _client.get(
        Endpoint.getUser,
        options: NetworkingUtil.setupNetworkOptions(
            'Bearer ${_local.read(LocalDataKey.token)}'),
      );
      final model = UserResponseModel.fromJson(responseJson.data);
      return model;
    } on DioException catch (_) {
      rethrow;
    }
  }

  /*
    This Function is used as challenge tester
    DO NOT modify this function
   */
  Future<void> testUnauthenticated() async {
    try {
      final realToken = _local.read<String?>(LocalDataKey.token);
      await _local.write(
          LocalDataKey.token, '619|kM5YBY5yM15KEuSmSMaEzlfv0lWs83r4cp4oty2T');
      getUser();
      //401 not caught as exception
      await _local.write(LocalDataKey.token, realToken);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
