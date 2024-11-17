import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/model/types_ui_model.dart';
import 'package:project/res/app_text_style/app_text_style.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/toast.dart';
import 'package:project/utils/ui_constant.dart';
import 'package:project/view/common/appbar_common.dart';
import 'package:project/view/common/common_dropdown_button.dart';
import 'package:project/view/common/common_textfromfield.dart';
import 'package:project/view/common/custom_button.dart';
import 'package:project/view/common/custom_check_box.dart';
import 'package:project/view/common/radio_button.dart';
import 'package:project/view/common/required_rich_text.dart';
import 'package:project/view_model/controller/input_type_controller.dart';
import 'package:provider/provider.dart';

class InputTypesView extends StatefulWidget {
  final List<TypesUiModel>? inputModelList;
  const InputTypesView({super.key, this.inputModelList});

  @override
  State<InputTypesView> createState() => _InputTypesViewState();
}

class _InputTypesViewState extends State<InputTypesView> {
  @override
  void initState() {
    super.initState();
    Provider.of<InputTypeController>(context, listen: false).fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Scaffold(
        appBar: const AppbarCommon(title: "Input Types"),
        body: Consumer<InputTypeController>(
            builder: (context, controller, child) {
          if (controller.typeUiList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.typeUiList.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                final data = controller.typeUiList[index];
                return Column(
                  children: [
                    _buildAllSection(context, data),
                    _divider(),
                  ],
                );
              },
            );
          }
        }),
        bottomNavigationBar: _buildSubmitButton(context),
      ),
    );
  }

  Widget _buildAllSection(BuildContext context, TypesUiModel data) {
    if ('${data.type}' == 'radio') {
      return _buildRadioSection(context, data);
    } else if ('${data.type}' == 'dropdown') {
      return _buildDropDownSection(context, data);
    } else if ('${data.type}' == 'checkbox') {
      return _buildCheckBoxSection(context, data);
    } else if ('${data.type}' == 'textfield') {
      return _buildTextFildSection(context, data);
    } else {
      return SizedBox.fromSize();
    }
  }

  Widget _buildRadioSection(BuildContext context, TypesUiModel data) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('${data.title}', style: AppTextStyle.tittleBig3()),
          gapH(context, 1),
          Consumer<InputTypeController>(builder: (context, controller, child) {
            return Column(
              children: [
                RequiredRichText(
                    isRequired: data.selectedValue != null ? true : false),
                gapH(context, 2),
                RadioButton(
                  values: data.options,
                  groupValue: data.selectedValue.toString(),
                  onChanged: (value) {
                    data.selectedValue = value;
                    setState(() {});
                  },
                ),
              ],
            );
          }),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildDropDownSection(BuildContext context, TypesUiModel data) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text('${data.title}', style: AppTextStyle.tittleBig3()),
          gapH(context, 2),
          Consumer<InputTypeController>(builder: (context, controller, child) {
            return CommonDropdownButton(
              selectedValue: data.selectedValue != null
                  ? int.parse(data.selectedValue.toString())
                  : 0,
              dropDownItemsNumbers:
                  List.generate(data.options.length, (index) => index),
              label: "BedRooms",
              onChanged: (p0) {
                data.selectedValue = p0.toString();
                setState(() {});
              },
            );
          }),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildCheckBoxSection(BuildContext context, TypesUiModel data) {
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text(
            data.title.toString(),
            style: AppTextStyle.tittleBig3(),
          ),
          gapH(context, 1),
          Consumer<InputTypeController>(
            builder: (context, controller, child) {
              return Column(
                children: data.options.map((option) {
                      return CustomCheckBox(
                          isChecked:
                              data.selectedValue?.contains(option) ?? false,
                          onChanged: (isChecked) {
                            if (isChecked ?? false) {
                              if (data.selectedValue == null) {
                                data.selectedValue = option;
                              } else if (!data.selectedValue!
                                  .contains(option)) {
                                data.selectedValue = option;
                              }
                            } else {
                              data.selectedValue = null;
                            }
                            setState(() {});
                          },
                          text: option);
                    }).toList() ??
                    [],
              );
            },
          ),
          gapH(context, 4),
        ],
      ),
    );
  }

  Widget _buildTextFildSection(BuildContext context, TypesUiModel data) {
    // final controller = Provider.of<InputTypeController>(context).textController;
    TextEditingController controller =
        TextEditingController(text: data.selectedValue);
    return Padding(
      padding: screenPaddingH(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH(context, 4),
          Text(data.title.toString(), style: AppTextStyle.tittleBig3()),
          gapH(context, 2),
          CommonTextFormField(
            controller: controller,
            onChanged: (text) {
              data.selectedValue = text;
            },
            hintText: 'Type here ..',
          ),
          gapH(context, 4),
        ],
      ),
    );
  }

  //======================================================
  Widget _divider() => Container(height: 4.sp, color: AppColors.greyColor);

  Widget _buildSubmitButton(BuildContext context) {
    final controller = Provider.of<InputTypeController>(context);
    return Container(
      height: 70.sp,
      padding: edgeInsetsSym(context, 4, 2),
      child: CustomButton(
        buttonName: "Submit",
        onTap: () {
          List<TypesUiModel> _list = [];
          int _selectedInputCount = 0;
          for (int i = 0; i < controller.typeUiList.length; i++) {
            final data = controller.typeUiList[i];

            if ('${data.type}' == 'radio' && data.selectedValue == null) {
              showErrorToast(
                  context, "Required Filed", "Please Fill the Required Fild");
              return;
            } else {
              _list.add(data);
              if (data.selectedValue != null &&
                  data.selectedValue.toString() != "") {
                _selectedInputCount++;
              }
            }
          }

          controller.submitButton(context, _list, _selectedInputCount);
        },
      ),
    );
  }
}
