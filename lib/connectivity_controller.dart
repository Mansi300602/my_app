import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var isConnected = true.obs; // Observed variable for connection status
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection(); // Initial connection check
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Check initial connection status
  Future<void> _checkInitialConnection() async {
    var result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  // Update connection status
  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      if (isConnected.value) {
        isConnected.value = false; // Update connection status
        _showNoConnectionPopup(); // Show popup
      }
    } else {
      if (!isConnected.value) {
        isConnected.value = true; // Update connection status
        Get.back(); // Dismiss the popup if connection is restored
      }
    }
  }

  // Show popup when there is no connection
  void _showNoConnectionPopup() {
    Get.defaultDialog(
      title: "No Internet Connection",
      middleText: "Please check your internet settings.",
      barrierDismissible: false,
      textConfirm: "OK",
      confirmTextColor: Get.theme.primaryColorLight,
      onConfirm: () {
        Get.back();
      },
    );
  }
}
