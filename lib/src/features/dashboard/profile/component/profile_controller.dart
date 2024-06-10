import 'dart:io';

import 'package:dio/dio.dart';
import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../app/routes/route_name.dart';
import '../../../../utils/networking_util.dart';
import '../../../../widgets/snackbar_widget.dart';

class ProfileController extends GetxController {
  final UserRepository _userRepository;

  final isLoading = false.obs;

  final _name = "".obs;

  String get name => _name.value;

  final _phone = "".obs;

  String get phone => _phone.value;

  final _profilePictureUrl = "".obs;

  String get profilePictureUrl => _profilePictureUrl.value;

  ProfileController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  void onInit() {
    super.onInit();
    loadUserFromServer();
  }

  void loadUserFromServer() async {
    try {
      final response = await _userRepository.getUser();
      if (response.status == 0) {
        final localUser = response.data;

        _name.value = localUser.name;
        _phone.value = localUser.countryCode.isNotEmpty
            ? "+${localUser.countryCode}${localUser.phone}"
            : "";
        _profilePictureUrl.value = localUser.profilePicture ?? '';
      } else {
        SnackbarWidget.showFailedSnackbar(response.message);
      }
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
  }

  onEditProfileClick() async {
    Get.toNamed(RouteName.editProfile);
  }

  /*
    This Function is used as challenge tester
    DO NOT modify this function
   */
  onTestUnauthenticatedClick() async {
    await _userRepository.testUnauthenticated();
  }

  onDownloadFileClick() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final dio = Dio();
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/flutter_tutorial.pdf');
      dio.download(
          'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
          file.path);
      if (await file.exists()) {
        // File has been downloaded
        SnackbarWidget.showSuccessSnackbar('File downloaded successfully');
      } else {
        // File has not been downloaded
        SnackbarWidget.showFailedSnackbar('File download failed');
      }
    } else {
      SnackbarWidget.showFailedSnackbar('Permission denied');
    }
  }

  onOpenWebPageClick() async {
    Get.toNamed(RouteName.webView);
  }

  void doLogout() async {
    isLoading.value = true;
    await _userRepository.logout();
    isLoading.value = false;
    Get.offAllNamed(RouteName.login);
  }
}
