import 'package:flutter_boilerplate/core/common/network_info.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final NetworkInfo _networkInfo;

  ConnectivityController(this._networkInfo);

  @override
  Future<void> onInit() async {
    await checkConnectivity();
    super.onInit();
  }

  final isConnected = false.obs;

  Future<void> checkConnectivity() async {
    _networkInfo.onConnectivityChanged.listen((value) {
      isConnected.value = value;
    });
  }
}
