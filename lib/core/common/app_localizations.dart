import 'package:get/get.dart';

abstract class AppLocalizations {
  AppLocalizations._();

  static String selectFromGallery = 'selectFromGallery'.tr;
  static String openCamera = 'openCamera'.tr;
  static String uploadPhoto = 'uploadPhoto'.tr;
  static String uploadVideo = 'uploadVideo'.tr;
  static String gallery = 'gallery'.tr;
  static String camera = 'camera'.tr;
  static String microphone = 'microphone'.tr;
  static String cancel = 'cancel'.tr;
  static String openSetting = 'openSetting'.tr;
  static String requestPermissionTitle(String appName, String permissionType) =>
      'permissionMessage'.trParams({
        'appName': appName,
        'permissionType': permissionType,
      });
  static String permissionMessage = 'permissionMessage'.tr;
  static String usersTitle = 'usersTitle'.tr;
  static String userDetail = 'userDetail'.tr;
  static String username = 'username'.tr;
  static String firstName = 'firstName'.tr;
  static String lastName = 'lastName'.tr;
  static String password = 'password'.tr;
  static String usernamePlaceholder = 'usernamePlaceholder'.tr;
  static String firstNamePlaceholder = 'firstNamePlaceholder'.tr;
  static String lastNamePlaceholder = 'lastNamePlaceholder'.tr;
  static String passwordPlaceholder = 'passwordPlaceholder'.tr;
  static String login = 'login'.tr;
  static String loginSubtitle = 'loginSubtitle'.tr;
}
