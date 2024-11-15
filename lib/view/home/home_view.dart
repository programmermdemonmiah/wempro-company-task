import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/res/app_routes/app_routes.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/ui_constant.dart';
import 'package:project/view/common/appbar_common.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCommon(
        title: "Home",
        leading: SizedBox(),
      ),
      body: SafeArea(child: ListView()),
      floatingActionButton: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: radiusAll(context, 30)),
        child: InkWell(
          onTap: () => AppRoutes.goInputTypeView(context),
          child: Container(
            padding: edgeInsetsAll(context, 2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
            child: Icon(
              Icons.add,
              size: 30.sp,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
