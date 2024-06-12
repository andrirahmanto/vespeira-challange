import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {
  final stateBoarding = 0.obs;
  final pageContorller = PageController();
  final contentLength = 4;

  @override
  void onInit() {
    super.onInit();
  }

  void onSkipTap() {
    Get.offNamed('/login');
  }

  void onFinisTap() {
    Get.offNamed('/login');
  }

  void onNextTap() {
    stateBoarding.value = stateBoarding.value + 1;
    pageContorller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
