import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final NetworkInfo _networkInfo;

  ConnectivityController(this._networkInfo);

  @override
  void onInit() {
    super.onInit();

    _networkInfo.onConnectivityChanged.listen((isConnected) {
      if (!isConnected && Get.isBottomSheetOpen == false) {
        Utils.showNoInternetBottomSheet();
      } else if (isConnected && Get.isBottomSheetOpen == true) {
        Get.back();
      }
    });
  }
}
