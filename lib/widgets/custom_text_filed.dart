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
  final String? prefixText;
  final int? maxLines;
  final double borderRadius;
  final InputBorder? border;
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
    this.prefixText,
    this.maxLines = 1,
    this.borderRadius = 10,
    this.border,
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
          maxLines: maxLines,
          decoration: InputDecoration(
            label: Text(
              label,
              style: TextStyle(
                color: errorText == null ? Colors.red : Colors.black,
              ),
            ),
            hintText: hintText,
            border: border != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
                : null,

            suffixIcon: suffixIcon,
            prefixText: prefixText,
            errorText: errorText,
            enabledBorder: border != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
                : UnderlineInputBorder(),
            focusedBorder: border != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
                : null,
            errorBorder: border != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
                : null,
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
