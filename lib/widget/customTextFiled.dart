import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final String? validationMessage;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.controller,
    required this.prefixIcon,
    this.validationMessage,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validationMessage != null
          ? (value) {
              if (value == null || value.isEmpty) {
                return validationMessage;
              }
              return null;
            }
          : null, // فحص إذا كانت القيمة غير فارغة
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0XFF1B4158),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0XFF1B4158),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
