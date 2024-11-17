import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/ui_constant.dart';

class CommonDropdownButton extends StatelessWidget {
  final int selectedValue;
  final List<int> dropDownItemsNumbers;
  final String label;
  final void Function(int) onChanged;
  const CommonDropdownButton(
      {super.key,
      required this.selectedValue,
      required this.dropDownItemsNumbers,
      required this.label,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 35,
      padding: edgeInsetsSym(context, 4, 0),
      decoration: BoxDecoration(
        border: Border.all(
          width: selectedValue == 0 ? 2.sp : 1.5.sp,
          color: selectedValue == 0
              ? AppColors.blackColor.withOpacity(0.3)
              : AppColors.blackColor,
        ),
        borderRadius: radiusAll(context, 2),
      ),
      child: DropdownButton<int>(
        value: selectedValue,
        icon: Icon(Icons.keyboard_arrow_down_rounded,
            color: selectedValue == 0
                ? AppColors.blackColor.withOpacity(0.5)
                : AppColors.blackColor),
        underline: const SizedBox.shrink(),
        borderRadius: radiusAll(context, 2),
        items: dropDownItemsNumbers.map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width - 100,
                child: Text("$value $label",
                    style: AppTextStyle.tittleBig4().copyWith(
                        color: selectedValue == 0 || value != selectedValue
                            ? AppColors.blackColor.withOpacity(0.5)
                            : AppColors.blackColor))),
          );
        }).toList(),
        onChanged: (int? newValue) => onChanged(newValue!),
      ),
    );
  }
}
