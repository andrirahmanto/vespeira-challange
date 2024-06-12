import 'package:entrance_test/app/routes/route_name.dart';
import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  final UserRepository _userRepository;
  final appVersion = "".obs;

  SplashController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  void onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    await Future.delayed(const Duration(seconds: 3), () {});
    if (_userRepository.isTokenExist()) {
      Get.offNamed(RouteName.boarding);
    } else {
      Get.offNamed(RouteName.login);
    }
  }
}
