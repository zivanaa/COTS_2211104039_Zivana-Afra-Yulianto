import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // TextEditingController untuk input nomor telepon
  final phoneNumberController = TextEditingController();

  // Method untuk login
  void login() {
    if (phoneNumberController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Phone number cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Login",
        "Logging in with ${phoneNumberController.text}",
        snackPosition: SnackPosition.BOTTOM,
      );
      // Tambahkan logika login di sini
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
