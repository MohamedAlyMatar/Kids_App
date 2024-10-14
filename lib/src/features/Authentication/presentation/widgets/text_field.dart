import 'package:flutter/material.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?) onSaved;

  const MyTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: AppColors.textFieldColor,
        filled: true,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
