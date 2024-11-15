import 'package:flutter/material.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/ui_constant.dart';

class RadioButton extends StatelessWidget {
  final List<String> values;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  const RadioButton(
      {super.key,
      required this.values,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < values.length; i++)
        Row(
          children: [
            Radio(
              value: values[i],
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: AppColors.blackColor,
            ),
            gapW(context, 2),
            Text(
              values[i],
              style: values[i] == groupValue
                  ? AppTextStyle.text1()
                  : AppTextStyle.paragraph1(),
            ),
          ],
        ),
    ]);
  }
}
