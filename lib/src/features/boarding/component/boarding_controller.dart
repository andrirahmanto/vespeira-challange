import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {
  final stateBoarding = 0.obs;
  final pageContorller = PageController();
  final contentLength = 4;

  BoardingController({
    required UserRepository userRepository,
  });

  void onSkipTap() {
    Get.offNamed('/login');
  }

  void onFinisTap() {
    Get.find<UserRepository>().boardingPassed();
    Get.offNamed('/login');
  }

  void onNextTap() {
    stateBoarding.value = stateBoarding.value + 1;
    pageContorller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
