import 'package:entrance_test/src/features/dashboard/profile/component/profile_controller.dart';
import 'package:entrance_test/src/repositories/user_repository.dart';
import 'package:entrance_test/src/utils/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/date_util.dart';
import '../../../../../utils/networking_util.dart';
import '../../../../../widgets/snackbar_widget.dart';

class EditProfileController extends GetxController {
  final UserRepository _userRepository;

  EditProfileController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  final etFullName = TextEditingController();
  final etPhoneNumber = TextEditingController();
  final etEmail = TextEditingController();
  final etHeight = TextEditingController();
  final etWeight = TextEditingController();
  final etBirthDate = TextEditingController();

  final _countryCode = "".obs;

  String get countryCode => _countryCode.value;

  final _gender = ''.obs;

  String get gender => _gender.value;

  final _profilePictureUrlOrPath = ''.obs;

  String get profilePictureUrlOrPath => _profilePictureUrlOrPath.value;

  final _isLoadPictureFromPath = false.obs;

  bool get isLoadPictureFromPath => _isLoadPictureFromPath.value;

  final _isGenderFemale = false.obs;

  bool get isGenderFemale => _isGenderFemale.value;

  DateTime birthDate = DateTime.now();

  final _errorFullName = ''.obs;

  String get errorFullName => _errorFullName.value;

  final _errorEmail = ''.obs;

  String get errorEmail => _errorEmail.value;

  final _errorHeight = ''.obs;

  String get errorHeight => _errorHeight.value;

  final _errorWeight = ''.obs;

  String get errorWeight => _errorWeight.value;

  final _errorBirthDate = ''.obs;

  String get errorBirthDate => _errorBirthDate.value;

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
        etFullName.text = localUser.name;
        etPhoneNumber.text = localUser.phone;
        etEmail.text = localUser.email ?? '';
        etHeight.text = localUser.height?.toString() ?? '';
        etWeight.text = localUser.weight?.toString() ?? '';

        _countryCode.value = localUser.countryCode;

        _profilePictureUrlOrPath.value = localUser.profilePicture ?? '';
        _isLoadPictureFromPath.value = false;

        _gender.value = localUser.gender ?? '';
        if (gender.isNullOrEmpty || gender == 'laki_laki') {
          onChangeGender(false);
        } else {
          onChangeGender(true);
        }

        etBirthDate.text = '';
        if (localUser.dateOfBirth.isNullOrEmpty == false) {
          birthDate =
              DateUtil.getDateFromShortServerFormat(localUser.dateOfBirth!);
          etBirthDate.text = DateUtil.getBirthDate(birthDate);
        }
      } else {
        SnackbarWidget.showFailedSnackbar(response.message);
      }
    } catch (error) {
      error.printError();
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
  }

  void changeImage() async {
    //TODO: Implement change profile image
  }

  void onChangeGender(bool isFemale) {
    if (isFemale) {
      _gender.value = 'perempuan';
    } else {
      _gender.value = 'laki_laki';
    }
    _isGenderFemale.value = isFemale;
  }

  void onChangeBirthDate(DateTime dateTime) {
    birthDate = dateTime;
    etBirthDate.text = DateUtil.getBirthDate(birthDate);
  }

  void checkFullname() {
    if (etFullName.text.isNullOrEmpty) {
      _errorFullName.value = 'Nama tidak boleh kosong';
      return;
    }
    _errorFullName.value = '';
  }

  void checkEmail() {
    if (etEmail.text.isNullOrEmpty) {
      _errorEmail.value = 'Email tidak boleh kosong';
      return;
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(etEmail.text)) {
      _errorEmail.value = 'Email tidak valid';
      return;
    }
    _errorEmail.value = '';
  }

  void checkHeight() {
    if (etHeight.text.isNullOrEmpty) {
      _errorHeight.value = 'Height tidak boleh kosong';
      return;
    }
    if (int.parse(etHeight.text) < 0) {
      _errorHeight.value = 'Height tidak boleh < 0';
      return;
    }
    _errorHeight.value = '';
  }

  void checkWeight() {
    if (etWeight.text.isNullOrEmpty) {
      _errorWeight.value = 'Weight tidak boleh kosong';
      return;
    }
    if (int.parse(etWeight.text) < 0) {
      _errorWeight.value = 'Weight tidak boleh < 0';
      return;
    }
    _errorWeight.value = '';
  }

  void checkBirthDate() {
    if (etBirthDate.text.isNullOrEmpty) {
      _errorBirthDate.value = 'Tanggal lahir tidak boleh kosong';
      return;
    }
    try {
      DateUtil.getBirthDateFromString(etBirthDate.text);
    } catch (e) {
      _errorBirthDate.value = 'Tanggal lahir tidak valid';
      return;
    }
    _errorBirthDate.value = '';
  }

  bool isDataValid() {
    checkFullname();
    checkEmail();
    checkHeight();
    checkWeight();
    checkBirthDate();

    return errorFullName.isNullOrEmpty &&
        errorEmail.isNullOrEmpty &&
        errorHeight.isNullOrEmpty &&
        errorWeight.isNullOrEmpty &&
        errorBirthDate.isNullOrEmpty;
  }

  void saveData() async {
    _isLoading.value = true;
    await _userRepository.updateUser(
      name: etFullName.text,
      email: etEmail.text,
      gender: gender,
      dateOfBirth: DateUtil.changeFormatToShort(etBirthDate.text),
      height: int.parse(etHeight.text),
      weight: int.parse(etWeight.text),
    );
    SnackbarWidget.showSuccessSnackbar('Berhasil update data');
    loadUserFromServer();
    Get.find<ProfileController>().loadUserFromServer();
    _isLoading.value = false;
  }
}
