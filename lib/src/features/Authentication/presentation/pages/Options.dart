import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/utils/assets_manager.dart';

class Options extends StatelessWidget {
  Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.backgroundColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(ImgAssets.new_user, width: 100),
            const Text(
              "Don't have an account? Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildButton(
              context,
              label: "Sign Up",
              onPressed: () {
                // Navigate to Sign Up Screen
                Navigator.pushNamed(context, Routes.signUp);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(ImgAssets.old_user, width: 100),
            const Text(
              'Already have an account? Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildButton(
              context,
              label: "Sign In",
              onPressed: () {
                // Navigate to Sign In Screen
                Navigator.pushNamed(context, Routes.signIn);
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.gamesMenu);
              },
              child: const Text(
                'Skip',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  // Helper method to build square buttons
  Widget _buildButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return Container(
      padding: const EdgeInsets.all(10),
      // width: double.infinity,
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.backgroundColor,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
