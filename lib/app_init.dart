import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:netro_creative_interview_work/common/theme/light_theme.dart';
import 'package:netro_creative_interview_work/view/RedirectScreen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netro Creative',
      theme: buildLightTheme(),
      home: const RedirectScreen(),
      builder: EasyLoading.init(),
    );
  }
}