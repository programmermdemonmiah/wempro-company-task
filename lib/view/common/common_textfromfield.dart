import 'package:flutter/material.dart';
import 'package:project/utils/ui_constant.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? hintText;
  final Function(String)? onFieldSubmitted;
  final int? minLines;
  final int? maxLength;
  final Color? fillColor;
  final double radiusSet;
  final EdgeInsetsGeometry? padding;
  const CommonTextFormField({
    super.key,
    required this.controller,
    this.inputType,
    this.focusNode,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    required this.hintText,
    this.fillColor,
    this.radiusSet = 2.5,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.black38,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor ?? Colors.grey[200],
        contentPadding: padding ?? edgeInsetsSym(context, 4, 2),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radiusAll(context, radiusSet),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radiusAll(context, radiusSet),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radiusAll(context, radiusSet),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radiusAll(context, radiusSet),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radiusAll(context, radiusSet),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: radiusAll(context, radiusSet),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
