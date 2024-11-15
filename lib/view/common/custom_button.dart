import 'package:flutter/material.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/ui_constant.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final BuildContext? context;
  final Color? fontColor;
  final Color? borderColor;
  final Color? bgColor;
  final double? radius;
  final Gradient? borderGradient;
  final bool isBorderGradient;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.buttonName,
    this.context,
    this.fontColor,
    this.bgColor,
    this.borderColor,
    this.borderGradient,
    this.focusNode,
    this.onTap,
    this.radius,
    this.isLoading = false,
    this.isBorderGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          // height: 40.sp,
          width: double.infinity,
          // padding: edgeInsetsAll(2.2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: radiusAll(context, radius ?? 2.5),
              border: Border.all(
                width: 2,
                color: borderColor ?? AppColors.primaryColor,
              ),
              color: bgColor ?? AppColors.primaryColor),
          child: InkWell(
            onTap: onTap,
            focusNode: focusNode,
            splashColor: Colors.black12,
            child: Container(
              width: double.infinity,
              padding: edgeInsetsAll(context, 2.2),
              child: Text(
                buttonName,
                textAlign: TextAlign.center,
                style: AppTextStyle.tittleBig3(
                  color: fontColor ?? Colors.white,
                ),
              ),
            ),
          ),
        ),
        if (isLoading)
          CircularProgressIndicator(
            color: Colors.grey[200],
          )
      ],
    );
  }
}
