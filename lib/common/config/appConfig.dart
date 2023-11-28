
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

initLoading(){
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.pulse
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 100.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.red
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}