import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/model/selected_input_model.dart';
import 'package:project/model/types_ui_model.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/toast.dart';
import 'package:project/utils/ui_constant.dart';
import 'package:project/view/common/appbar_common.dart';
import 'package:project/view/common/common_textfromfield.dart';
import 'package:project/view/common/custom_button.dart';
import 'package:project/view/common/custom_check_box.dart';
import 'package:project/view/common/radio_button.dart';
import 'package:project/view/common/required_rich_text.dart';
import 'package:project/view_model/controller/input_type_controller.dart';
import 'package:provider/provider.dart';

class InputTypesView extends StatefulWidget {
  final List<SelectedInputModel>? inputModelList;
  const InputTypesView({super.key, this.inputModelList});

  @override
  State<InputTypesView> createState() => _InputTypesViewState();
}

class _InputTypesViewState extends State<InputTypesView> {
  @override
  void initState() {
    super.initState();
    // Provider.of<InputTypeController>(context, listen: false).fetchData(context);
    if (widget.inputModelList != null) checkInput();
  }

  checkInput() {
    for (int i = 0; i < widget.inputModelList!.length; i++) {
      switch (widget.inputModelList![i].sectionName) {
        case '':
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Scaffold(
        appBar: const AppbarCommon(title: "Input Types"),
        // body: Consumer<InputTypeController>(
        //     builder: (context, controller, child) {
        //   if (controller.typeUiList.isEmpty) {
        //     return Center(child: CircularProgressIndicator());
        //   } else {
        //     return ListView.builder(
        //       itemCount: controller.typeUiList.length,
        //       shrinkWrap: true,
        //       primary: false,
        //       itemBuilder: (context, index) {
        //         final data = controller.typeUiList[index];
        //         if ('${data.type}' == 'radio') {
        //           return _buildRadioSection(context, data);
        //         } else if ('${data.type}' == 'dropdown') {
        //           return _buildDropDownSection(context, data);
        //         } else {
        //           return SizedBox.fromSize();
        //         }
        //       },
        //     );
        //   }
        // }),
        body: ListView(
          controller: Provider.of<InputTypeController>(context, listen: false)
              .scrollController,
          children: [
            _buildOutdoorAreaSection(context),
            _divider(),
            _buildBedroomsSection(context),
            _buildBathroomsSection(context),
            _divider(),
            _buildCleaningFrequencySection(context),
            _divider(),
            _buildGarageCleaningSection(context),
            _divider(),
            _buildIncludeOutdoorArea(context),
            _divider(),
            _buildCleaningTimeSection(context),
            _divider(),
          ],
        ),
        bottomNavigationBar: _buildSubmitButton(context),
      ),
    );
  }

  // Widget _buildRadioSection(BuildContext context, TypesUiModel data) {
  //   return Padding(
  //     padding: screenPaddingH(context),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         gapH(context, 4),
  //         Text('${data.title}', style: AppTextStyle.tittleBig3()),
  //         gapH(context, 1),
  //         Consumer<InputTypeController>(builder: (context, controller, child) {
  //           return Focus(
  //             focusNode: controller.includeOutdoorAreaFocusNode,
  //             child: Column(
  //               children: [
  //                 RequiredRichText(
  //                     isRequired: controller.isIncloudRequiredValue),
  //                 gapH(context, 2),
  //                 RadioButton(
  //                   values: data.options!,
  //                   groupValue: controller.inCloudOutdoorGroupValue,
  //                   onChanged: (value) {
  //                     controller.changeIncloudOutdoorGroupValue(value);
  //                   },
  //                 ),
  //               ],
  //             ),
  //           );
  //         }),
  //         gapH(context, 4),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDropDownSection(BuildContext context, TypesUiModel data) {
  //   return Padding(
  //     padding: screenPaddingH(context),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         gapH(context, 4),
  //         Text('${data.title}', style: AppTextStyle.tittleBig3()),
  //         gapH(context, 2),
  //         Consumer<InputTypeController>(builder: (context, controller, child) {
  //           return _buildDropdown(
  //             context,
  //             selectedValue: controller.numberOfBedrooms,
  //             dropDownItemsNumbers:
  //                 List.generate(data.options!.length, (index) => index),
  //             label: "BedRooms",
  //             onChanged: (p0) {
  //               controller.changeNumberOfBedRooms(p0);
  //             },
  //           );
  //         }),
  //         gapH(context, 4),
  //       ],
  //     ),
  //   );
  // }
  //======================================================

  Widget _buildOutdoorAreaSection(BuildContext context) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('Include Outdoor Area', style: AppTextStyle.tittleBig3()),
          gapH(context, 1),
          Consumer<InputTypeController>(builder: (context, controller, child) {
            return Focus(
              focusNode: controller.includeOutdoorAreaFocusNode,
              child: Column(
                children: [
                  RequiredRichText(
                      isRequired: controller.isIncloudRequiredValue),
                  gapH(context, 2),
                  RadioButton(
                    values: controller.incloudOutdoorVaueList,
                    groupValue: controller.inCloudOutdoorGroupValue,
                    onChanged: (value) {
                      controller.changeIncloudOutdoorGroupValue(value);
                    },
                  ),
                ],
              ),
            );
          }),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _divider() => Container(height: 4.sp, color: AppColors.greyColor);

  Widget _buildBedroomsSection(BuildContext context) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('Number of Bedrooms', style: AppTextStyle.tittleBig3()),
          gapH(context, 2),
          Consumer<InputTypeController>(builder: (context, controller, child) {
            return _buildDropdown(
              context,
              selectedValue: controller.numberOfBedrooms,
              dropDownItemsNumbers: controller.dropDownNumber,
              label: "BedRooms",
              onChanged: controller.changeNumberOfBedRooms,
            );
          }),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildBathroomsSection(BuildContext context) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('Number of Bathrooms', style: AppTextStyle.tittleBig3()),
          gapH(context, 2),
          Consumer<InputTypeController>(builder: (context, controller, child) {
            return _buildDropdown(
              context,
              selectedValue: controller.numberOfBathrooms,
              dropDownItemsNumbers: controller.dropDownNumber,
              label: "Bathrooms",
              onChanged: controller.changeNumberOfBathRooms,
            );
          }),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    required int selectedValue,
    required List<int> dropDownItemsNumbers,
    required String label,
    required void Function(int) onChanged,
  }) {
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

  Widget _buildCleaningFrequencySection(BuildContext context) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('Cleaning Frequency', style: AppTextStyle.tittleBig3()),
          gapH(context, 1),
          Consumer<InputTypeController>(builder: (context, controller, child) {
            return Focus(
              focusNode: controller.cleaningFrequencyFocusNode,
              child: Column(
                children: [
                  RequiredRichText(
                      isRequired: controller.isCleaningFrequencyRequiredValue),
                  gapH(context, 2),
                  RadioButton(
                    values: controller.cleaningFrequencyValueList,
                    groupValue: controller.cleaningFrequencyGroupValue,
                    onChanged: (p0) {
                      controller.changeCleaningFrequencyGroupValue(p0);
                    },
                  ),
                ],
              ),
            );
          }),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildGarageCleaningSection(BuildContext context) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('Include Garage Cleaning', style: AppTextStyle.tittleBig3()),
          gapH(context, 1),
          Consumer<InputTypeController>(builder: (context, controller, child) {
            return Column(
              children: [
                CustomCheckBox(
                  isChecked: controller.includeGarageCleaning == "Yes",
                  onChanged: (value) =>
                      controller.changeIncludeGarageCleaning("Yes"),
                  text: "Yes",
                ),
                CustomCheckBox(
                  isChecked: controller.includeGarageCleaning == "No",
                  onChanged: (value) =>
                      controller.changeIncludeGarageCleaning("No"),
                  text: "No",
                ),
              ],
            );
          }),
          gapH(context, 4),
        ],
      ),
    );
  }

  _buildIncludeOutdoorArea(BuildContext context) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text(
            'Include Outdoor Area',
            style: AppTextStyle.tittleBig3(),
          ),
          gapH(context, 1),
          Consumer<InputTypeController>(
            builder: (context, controller, child) {
              return Column(
                children: [
                  CustomCheckBox(
                      isChecked:
                          controller.includeOutdoorAreaCheck == "Including"
                              ? true
                              : false,
                      onChanged: (p0) {
                        controller.changeIncludeOutdoorArea("Including");
                      },
                      text: "Including"),
                  CustomCheckBox(
                      isChecked:
                          controller.includeOutdoorAreaCheck == "Excluding"
                              ? true
                              : false,
                      onChanged: (p0) {
                        controller.changeIncludeOutdoorArea("Excluding");
                      },
                      text: "Excluding"),
                ],
              );
            },
          ),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildCleaningTimeSection(BuildContext context) {
    final controller = Provider.of<InputTypeController>(context).textController;
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('Preferred Cleaning Time', style: AppTextStyle.tittleBig3()),
          gapH(context, 2),
          CommonTextFormField(
            controller: controller,
            hintText: 'Type here ..',
          ),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final controller = Provider.of<InputTypeController>(context);
    return Container(
      height: 70.sp,
      padding: edgeInsetsSym(context, 4, 2),
      child: CustomButton(
        buttonName: "Submit",
        onTap: () {
          if (controller.inCloudOutdoorGroupValue == "") {
            controller.requestIncludeOutdoorAreaFocus();
            showErrorToast(
                context, "Required Field", "Please Fill required Field");
            return;
          } else if (controller.cleaningFrequencyGroupValue == "") {
            controller.requestCleaningFrequencyFocus();
            showErrorToast(
                context, "Required Field", "Please Fill required Field");

            return;
          } else {
            controller.submitButton(context);
          }
        },
      ),
    );
  }
}
