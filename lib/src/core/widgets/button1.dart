import 'package:flutter/material.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';
import 'package:kids_app/src/core/widgets/mytext.dart';

class Button1 extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;

  Button1({required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        ),
        child: Mytext(
          text: textButton,
          textColor: Colors.black,
          textSize: 20,
        ),
      ),
    );
  }
}
