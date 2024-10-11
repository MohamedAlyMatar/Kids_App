import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';

class Options extends StatelessWidget {
  Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
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
                'Is it your first time?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _buildButton(
                context,
                label: "Sign In",
                onPressed: () {
                  // Navigate to Sign In Screen
                  Navigator.pushNamed(context, Routes.signIn);
                },
              ),
              const SizedBox(height: 16),
              _buildButton(
                context,
                label: "Sign Up",
                onPressed: () {
                  // Navigate to Sign Up Screen
                  Navigator.pushNamed(context, Routes.signUp);
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blue, // Customize the button color
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
