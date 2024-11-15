import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/all_binding/all_providers.dart';
import 'package:project/res/app_routes/app_routes.dart';
import 'package:project/res/app_routes/app_routes_name.dart';
import 'package:project/res/color_manager/app_colors.dart';
import 'package:project/utils/app_constant.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: allProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (_, __) {
          return MaterialApp(
            title: AppConstant.appName,
            routes: AppRoutes.appRoutes,
            initialRoute: AppRoutesName.splash,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.whiteColor,
            ),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
