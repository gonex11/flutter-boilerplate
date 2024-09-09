import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity _connectivity;

  const NetworkInfo(this._connectivity);

  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi);
  }

  Stream<bool> get onConnectivityChanged {
    final streamController = StreamController<bool>();
    _connectivity.onConnectivityChanged.listen((results) {
      final isConnected = results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi);
      streamController.add(isConnected);
    });

    return streamController.stream;
  }
}
