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
  final void Function(String)? onChanged;
  final String? errorText;
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
    this.onChanged,
    this.errorText,
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
          onChanged: onChanged,
          enabled: enabled,
          decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(
                color: errorText == null ? Colors.red : Colors.black,
              ),
            ),
            hintText: hintText,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

            suffixIcon: suffixIcon,
            errorText: errorText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: TextStyle(
              color: errorText == null ? Colors.red : Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
