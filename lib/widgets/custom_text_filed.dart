import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String label;
  final bool enabled;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final Widget? suffixIcon;
  const CustomTextFiled({
    super.key,
    required this.label,
    this.enabled = true,
    this.controller,
    this.keyBoardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        enabled: enabled,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        errorStyle: TextStyle(color: Colors.red),
      ),
    );
  }
}
