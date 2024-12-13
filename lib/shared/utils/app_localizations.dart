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
  static String save = 'save'.tr;
  static String addUser = 'addUser'.tr;
  static String passwordRequiredMessage = 'passwordRequiredMessage'.tr;
  static String passwordUpperCaseMessage = 'passwordUpperCaseMessage'.tr;
  static String passwordLowerCaseMessage = 'passwordLowerCaseMessage'.tr;
  static String passwordNumberMessage = 'passwordNumberMessage'.tr;
  static String passwordSpecialCharacterMessage =
      'passwordSpecialCharacterMessage'.tr;
  static String passwordNotMatchMessage = 'passwordNotMatchMessage'.tr;
  static String loading = 'loading'.tr;
  static String refreshing = 'refreshing'.tr;
  static String pullToRefresh = 'pullToRefresh'.tr;
  static String releaseToRefresh = 'releaseToRefresh'.tr;
  static String networkErrorTitle = 'networkErrorTitle'.tr;
  static String networkErrorMessage = 'networkErrorMessage'.tr;
  static String yes = 'yes'.tr;
  static String logoutTitle = 'logoutTitle'.tr;
  static String logoutMessage = 'logoutMessage'.tr;
  static String successTitle = 'successTitle'.tr;
  static String createUserSuccessMessage = 'createUserSuccessMessage'.tr;
  static String ok = 'ok'.tr;

  static String passwordMinCharacterMessage(int min) =>
      'passwordMinCharacterMessage'.trParams({
        'min': min.toString(),
      });
  static String requestPermissionTitle(String appName, String permissionType) =>
      'permissionMessage'.trParams({
        'appName': appName,
        'permissionType': permissionType,
      });
}
