import 'package:connectivity_plus/connectivity_plus.dart';

class MainCheckConnectivityHelper {
  factory MainCheckConnectivityHelper() {
    return _mainCheckConnectivityHelper;
  }

  MainCheckConnectivityHelper._internal();

  static final MainCheckConnectivityHelper _mainCheckConnectivityHelper =
      MainCheckConnectivityHelper._internal();

  Future<bool> checkConnectivity() async {
    final _connectivityResult = await Connectivity().checkConnectivity();
    return _connectivityResult == ConnectivityResult.mobile ||
        _connectivityResult == ConnectivityResult.wifi;
  }
}
