import 'package:flutter/material.dart';
import 'package:kids_app/src/config/routes/app_routes.dart';
import 'package:kids_app/src/features/Authentication/presentation/widgets/sign_in_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left Container (Sign Up Section)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.rocket_launch,
                              color: Colors.white, size: 48),
                          SizedBox(height: 20),
                          Text(
                            "Welcome to\nRocket Blast!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Blast off into a world of adventure and learning with our exciting kids app.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.signUp);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color(0xFFFFC107), // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Right Container (Sign In Section)
              Expanded(child: SignInForm()),
            ],
          ),
        ),
      ),
    );
  }
}
