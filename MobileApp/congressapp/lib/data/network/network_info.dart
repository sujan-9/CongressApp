import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> isConnected() async {
    late bool isConnected;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    } else {
      isConnected = false;
    }
    return isConnected;
  }
}
