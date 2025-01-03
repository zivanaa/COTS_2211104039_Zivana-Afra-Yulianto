import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs; // Variable reaktif untuk page index
  final pageController = PageController(); // PageController untuk PageView

  void onPageChanged(int index) {
    currentPage.value = index; // Update currentPage saat halaman berubah
  }
}
