import 'package:flutter/material.dart';
import 'package:kids_app/src/core/utils/app_colors.dart';

class PasswordField extends StatelessWidget {
  final String? password;
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?) onSaved;

  const PasswordField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isPasswordVisible = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColors.textFieldColor,
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          validator: validator,
          onSaved: onSaved,
        );
      },
    );
  }
}
