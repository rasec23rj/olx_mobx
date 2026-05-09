import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFiled extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool enabled;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final bool autocorrect;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFiled({
    super.key,
    required this.label,
    this.enabled = true,
    this.controller,
    this.keyBoardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText,
    this.autocorrect = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: keyBoardType,
          obscureText: obscureText,
          autocorrect: autocorrect,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            label: Text(label),
            hintText: hintText,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabled: enabled,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: TextStyle(color: Colors.red),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
