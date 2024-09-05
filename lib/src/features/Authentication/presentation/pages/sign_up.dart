import 'package:flutter/material.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignUpForm(),
      ),
    );
  }
}
