import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app/routes/route_name.dart';
import '../../../widgets/snackbar_widget.dart';

class LoginController extends GetxController {
  final UserRepository _userRepository;
  final isObscure = true.obs;
  final phoneRegex = RegExp(r'^[1-9][0-9]*$');

  final etPhone = TextEditingController();
  final etPassword = TextEditingController();

  final errorPhone = ''.obs;
  final errorPass = ''.obs;

  LoginController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  void inputCheck() {
    if (etPhone.text.length < 8 ||
        etPhone.text.length > 16 ||
        !phoneRegex.hasMatch(etPhone.text)) {
      errorPhone.value =
          'Nomor telepon harus 8-16 karakter dan tidak diawali 0';
    } else {
      errorPhone.value = '';
    }
    if (etPassword.text.length < 8) {
      errorPass.value = 'Password harus lebih dari 7';
    } else {
      errorPass.value = '';
    }
  }

  void doLogin() async {
    inputCheck();
    // if (etPhone.text != '85173254399' || etPassword.text != '12345678') {
    //   SnackbarWidget.showFailedSnackbar('Email atau password salah');
    //   return;
    // }
    // await _userRepository.login();
    // Get.offAllNamed(RouteName.dashboard);
  }
}
