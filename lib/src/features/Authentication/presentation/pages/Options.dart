import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';

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
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sign Up for your first time',
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
            ],
          ),
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
