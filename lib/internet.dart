import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myy_app/connectivity_controller.dart'; // Ensure this file contains ConnectivityController

class Internet extends StatelessWidget {
  const Internet({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ConnectivityController using Get.put()
    final ConnectivityController connectivityController =
    Get.put(ConnectivityController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Network Connectivity Example"),
      ),
      body: Obx(() {
        return Center(
          child: Text(
            connectivityController.isConnected.value
                ? "You are connected to the internet"
                : "You are disconnected from the internet",
            style: TextStyle(
              fontSize: 20,
              color: connectivityController.isConnected.value
                  ? Colors.green
                  : Colors.red,
            ),
          ),
        );
      }),
    );
  }
}
