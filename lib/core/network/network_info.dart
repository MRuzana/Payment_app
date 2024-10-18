import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkInfo {
  final Connectivity _connectivity = Connectivity();

  // Check if the device has an active internet connection
  Future<bool> isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Monitor the connection status continuously
  Stream<List<ConnectivityResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged;
}