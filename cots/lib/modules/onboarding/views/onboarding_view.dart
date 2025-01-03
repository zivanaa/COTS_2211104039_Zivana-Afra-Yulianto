import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../design_system/color.dart';
import '../../../design_system/typography.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header dengan Logo dan Ikon Bahasa
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/assets/images/Gojek Logo.png',
                  height: 40,
                ),
                Image.asset(
                  'lib/assets/images/Language.png',
                  height: 40,
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: onboardingController.pageController,
              onPageChanged: onboardingController.onPageChanged,
              itemCount: 3, // Jumlah halaman onboarding
              itemBuilder: (context, index) {
                return OnboardingContent(index: index);
              },
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width:
                      onboardingController.currentPage.value == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: onboardingController.currentPage.value == index
                        ? AppColors.primaryGreen
                        : AppColors.lightGray,
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 20),
          // Tombol Masuk dan Daftar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  onPressed: () {
                    Get.toNamed('/login'); // Navigasi ke halaman login
                  },
                  child: Text(
                    "Masuk",
                    style: AppTypography.h4.copyWith(color: AppColors.white),
                  ),
                ),
                SizedBox(height: 8),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side:
                        BorderSide(color: AppColors.primaryGreen), // Garis tepi
                    minimumSize:
                        const Size(double.infinity, 48), // Ukuran tombol sama
                  ),
                  onPressed: () {
                    Get.toNamed('/register'); // Navigasi ke halaman daftar
                  },
                  child: Text(
                    "Belum ada akun? Daftar dulu",
                    style: AppTypography.body1.copyWith(
                        color: AppColors.primaryGreen), // Warna teks hijau
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan privasi.",
                  textAlign: TextAlign.center,
                  style: AppTypography.body4.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final int index;

  const OnboardingContent({required this.index});

  @override
  Widget build(BuildContext context) {
    // Data konten onboarding
    final onboardingData = [
      {
        'image': 'lib/assets/images/onboarding1.png',
        'title': 'Transportasi & Logistik',
        'subtitle':
            'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
      },
      {
        'image': 'lib/assets/images/onboarding2.png',
        'title': 'Selamat datang di Gojek!',
        'subtitle':
            'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.',
      },
      {
        'image': 'lib/assets/images/onboarding3.png',
        'title': 'Pesan makan & belanja',
        'subtitle': 'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            onboardingData[index]['image']!,
            height: 250,
          ),
          SizedBox(height: 20),
          Text(
            onboardingData[index]['title']!,
            style: AppTypography.h2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            onboardingData[index]['subtitle']!,
            style: AppTypography.body1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
