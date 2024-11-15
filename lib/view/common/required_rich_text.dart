import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/ui_constant.dart';

class RequiredRichText extends StatelessWidget {
  final String? seconndText;
  final bool isRequired;
  const RequiredRichText(
      {super.key, this.seconndText = 'Select 1', required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isRequired
            ? Container(
                padding: edgeInsetsAll(context, 0.5),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Icon(
                  Icons.done,
                  color: AppColors.whiteColor,
                  size: 10.sp,
                ),
              )
            : Icon(
                Icons.warning_amber_rounded,
                size: 10.sp,
                color: AppColors.requiredColor,
              ),
        gapW(context, 2),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Required",
              style: AppTextStyle.paragraph3().copyWith(
                  color: isRequired
                      ? AppColors.primaryColor
                      : AppColors.requiredColor)),
          TextSpan(text: " . ", style: AppTextStyle.tittleSmall4()),
          TextSpan(text: seconndText, style: AppTextStyle.paragraph4()),
        ])),
      ],
    );
  }
}
