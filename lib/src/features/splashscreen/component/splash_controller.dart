import 'package:entrance_test/app/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  final appVersion = "".obs;

  @override
  void onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.offNamed(RouteName.login);
  }
}
