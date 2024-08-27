import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.enable = true,
    this.prefixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChange,
  });
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enable;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      obscureText: obscureText,
      enabled: enable,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.bColorGrey),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
