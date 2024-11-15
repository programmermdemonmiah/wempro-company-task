import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/res/app_text_style/app_text_style.dart';

class AppbarCommon extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  const AppbarCommon({super.key, required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      title: Text(title, style: AppTextStyle.tittleBig1()),
      centerTitle: true,
      leading: leading ??
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.blackColor,
              size: 22.sp,
            ),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
