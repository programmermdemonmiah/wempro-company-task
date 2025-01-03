import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/model/types_ui_model.dart';
import 'package:project/res/app_routes/app_routes.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/ui_constant.dart';
import 'package:project/view/common/appbar_common.dart';

class SelectedInputView extends StatelessWidget {
  final List<TypesUiModel> inputModelList;
  final int selectedInputCount;

  const SelectedInputView(
      {super.key,
      required this.inputModelList,
      required this.selectedInputCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCommon(title: ""),
      body: SafeArea(
          child: Padding(
        padding: screenPaddingH(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected Input',
                  style: AppTextStyle.tittleBig3(),
                ),
                Text(
                  '$selectedInputCount items',
                  style: AppTextStyle.tittleBig4(),
                ),
              ],
            ),
            gapH(context, 4),
            Container(
              padding: edgeInsetsSym(context, 4, 4),
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: radiusAll(context, 3),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: inputModelList.length,
                    itemBuilder: (context, index) {
                      final data = inputModelList[index];
                      if (data.selectedValue != null) {
                        return Padding(
                          padding: edgeInsetsSym(context, 0, 1),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.select_all,
                                color: AppColors.primaryColor,
                              ),
                              gapW(context, 2),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: data.title.toString() + ": ",
                                    style: AppTextStyle.tittleSmall2()),
                                TextSpan(
                                    text: data.selectedValue,
                                    style: AppTextStyle.paragraph2())
                              ]))
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  gapH(context, 2),
                  Divider(
                    thickness: 2.sp,
                    color: Colors.black12,
                  ),
                  gapH(context, 2),
                  InkWell(
                    onTap: () {
                      // AppRoutes.goInputTypeView(context, data: inputModelList);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Edit Selections',
                          style: AppTextStyle.tittleBig3(),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 22.sp,
                          color: AppColors.blackColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
