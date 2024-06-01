import 'package:cab_ren/bindings/general_bindings.dart';
import 'package:cab_ren/routes/app_routes.dart';
import 'package:cab_ren/utils/constants/colors.dart';
import 'package:cab_ren/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      /// Show Loader or Circular Progress ...
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
