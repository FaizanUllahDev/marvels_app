import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  @override
Future<bool> get isConnected => checkConnection();

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    // switch
    switch (connectivityResult.first) {
      case ConnectivityResult.none:
        return false;
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
        return true;
      default:
        return false;
    }
  }
}
