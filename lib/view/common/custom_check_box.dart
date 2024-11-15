import 'package:flutter/material.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final String text;
  final Function(bool?)? onChanged;
  const CustomCheckBox(
      {super.key,
      required this.isChecked,
      required this.onChanged,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
        ),
        Text(
          text,
          style: AppTextStyle.paragraph1(),
        ),
      ],
    );
  }
}
