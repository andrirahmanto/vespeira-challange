import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app/routes/route_name.dart';
import '../../../widgets/snackbar_widget.dart';

class LoginController extends GetxController {
  final UserRepository _userRepository;
  final isObscure = true.obs;
  final isLoading = false.obs;
  final phoneRegex = RegExp(r'^[1-9][0-9]*$');

  // TODO: Delete this dummy data after finish
  final etPhone = TextEditingController(text: '85173254399');
  final etPassword = TextEditingController(text: '12345678');

  final errorPhone = ''.obs;
  final errorPass = ''.obs;

  LoginController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  void phoneCheck() {
    if (etPhone.text.isEmpty) {
      errorPhone.value = 'Nomor telepon tidak boleh kosong';
      return;
    }
    if (!phoneRegex.hasMatch(etPhone.text)) {
      errorPhone.value = 'Nomor telepon berisi angka dan tidak dimulai dari 0';
      return;
    }
    if (etPhone.text.length < 8 || etPhone.text.length > 16) {
      errorPhone.value = 'Nomor telepon harus 8-16 karakter';
      return;
    }
    errorPhone.value = '';
  }

  void passwordCheck() {
    if (etPassword.text.length < 8) {
      errorPass.value = 'Password harus lebih dari 7';
      return;
    }
    errorPass.value = '';
  }

  void inputCheck() {
    phoneCheck();
    passwordCheck();
  }

  void doLogin() async {
    inputCheck();
    if (errorPhone.value != '' || errorPass.value != '') {
      return;
    }
    if (etPhone.text != '85173254399' || etPassword.text != '12345678') {
      SnackbarWidget.showFailedSnackbar('Email atau password salah');
      return;
    }
    isLoading.value = true;
    // TODO: Delete this delay after finish
    await Future.delayed(const Duration(seconds: 1));
    await _userRepository.login();
    isLoading.value = false;
    Get.offAllNamed(RouteName.dashboard);
  }
}
