import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../design_system/color.dart';
import '../../../design_system/typography.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              "Login",
              style: AppTypography.h2.copyWith(color: AppColors.black),
            ),
            SizedBox(height: 8),
            Text(
              "Enter your registered phone number to log in",
              style: AppTypography.body1.copyWith(color: AppColors.gray),
            ),
            SizedBox(height: 32),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone number",
                prefixText: "+62 ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.error_outline, color: AppColors.primaryOrange),
                SizedBox(width: 8),
                Text(
                  "Issue with number?",
                  style: AppTypography.body3
                      .copyWith(color: AppColors.primaryOrange),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  // Logika untuk login
                  Get.snackbar(
                    "Login",
                    "Logging in with ${phoneNumberController.text}",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Text(
                  "Continue",
                  style: AppTypography.h4.copyWith(color: AppColors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
