import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:flutter_boilerplate/core/common/utils.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final NetworkInfo _networkInfo;

  ConnectivityController(this._networkInfo);

  @override
  void onInit() async {
    await checkConnectivity();
    super.onInit();
  }

  final isConnected = false.obs;

  Future<void> checkConnectivity() async {
    _networkInfo.onConnectivityChanged.listen((value) {
      isConnected.value = value;

      if (!value && Get.isBottomSheetOpen == false) {
        Utils.showNoInternetBottomSheet();
      } else if (value && Get.isBottomSheetOpen == true) {
        Get.back();
      }
    });
  }
}
