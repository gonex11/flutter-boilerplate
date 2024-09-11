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
}
