import 'package:entrance_test/src/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/splash_controller.dart';

class SplashScreenPage extends GetView<SplashController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  white,
                  primary,
                ], // Replace with your chosen colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/icons/icon_vesperia.png'),
                  width: 200, // Replace with your app logo
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Obx(() => Text(
                    "Ver: ${controller.appVersion.value}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
