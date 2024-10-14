import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_event.dart';
import 'package:kids_app/src/features/Authentication/presentation/bloc/authentication_state.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/password_field.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/text_field.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is SignInLoading) {
              // Show loading indicator
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Signing in...'),
                duration: Duration(seconds: 2),
              ));
            } else if (state is SignInSuccess) {
              // Navigate to home screen on success
              Navigator.pushReplacementNamed(context, Routes.gamesMenu);
            } else if (state is SignInFailure) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: Center(
            child: Container(
              height: 450,
              width: 500,
              margin: const EdgeInsets.all(24.0),
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome Back!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                        label: "Email",
                        hintText: "Enter your email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(SignInEmailChanged(value));
                        },
                      ),
                      const SizedBox(height: 20),
                      PasswordField(
                        label: "Password",
                        hintText: "Enter your password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          context
                              .read<AuthenticationBloc>()
                              .add(SignInPasswordChanged(value));
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<AuthenticationBloc>()
                                    .add(SignInSubmitted());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.backgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Sign In'),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                        child: const Text(
                          'Don’t have an account? Sign Up',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
