import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.textInputType,
    required this.hintText,
    super.key,
    this.maxLine,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.minLine,
    this.onChanged,
    this.obscureText = false,
    this.autofocus = false,
    this.onTap,
  });

  final TextInputType textInputType;
  final int? maxLine;
  final int? minLine;
  final String hintText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool? autofocus;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool? obscureText;
  final Function(String)? onChanged;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 0.4,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        onChanged: widget.onChanged,
        autofocus: widget.autofocus!,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        maxLines: widget.maxLine,
        minLines: widget.minLine,
        obscureText: widget.obscureText!,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.grey,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class TextFieldForms extends StatefulWidget {
  const TextFieldForms({
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
    this.onPressed,
    this.prefixText,
    this.maxLines = 1,
    this.minLines = 1,
    this.minWith = 40,
    this.minHeight = 40,
    this.onTap,
  });

  final String hintText;
  final IconData? suffixIcon;
  final bool? obscureText;
  final bool enable;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? Function(String?)? onChange;
  final VoidCallback? onPressed;
  final String? prefixText;
  final int? maxLines;
  final int? minLines;
  final double? minWith;
  final double? minHeight;
  final VoidCallback? onTap;

  @override
  State<TextFieldForms> createState() => _TextFieldFormsState();
}

class _TextFieldFormsState extends State<TextFieldForms> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      obscureText: widget.obscureText!,
      enabled: widget.enable,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onTap: widget.onTap,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.kColorBlack,
          ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        prefixText: widget.prefixText,
        prefixIconConstraints: BoxConstraints(
          minWidth: widget.minWith!,
          minHeight: widget.minHeight!,
        ),
        prefixStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.kColorGrey,
        ),
        suffixIcon: IconButton(
          splashRadius: 24,
          onPressed: widget.onPressed,
          icon: Icon(
            widget.suffixIcon,
            size: 24,
          ),
        ),
        prefixIcon: widget.prefixIcon,
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
          borderSide: BorderSide(color: AppColors.kColorGrey.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: AppColors.kColorGrey.withOpacity(0.2)),
        ),
        filled: true,
        fillColor: AppColors.kColorWhite,
      ),
    );
  }
}
