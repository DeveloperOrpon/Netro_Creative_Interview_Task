import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart' as TOAST;
import 'package:fgi_y2j/config/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../config/config.dart';


showErrorDialogInTop(String title, String message, BuildContext context) {
  EasyLoading.dismiss();
  MotionToast.error(
    height: 75,
    width: Get.width * .9,
    position: MotionToastPosition.top,
    animationCurve: Curves.fastLinearToSlowEaseIn,
    animationDuration: const Duration(seconds: 1),
    layoutOrientation: ToastOrientation.ltr,
    toastDuration: const Duration(seconds: 4),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    description: Text(message, style: const TextStyle(fontSize: 12)),
    animationType: AnimationType.fromRight,
  ).show(context);
}

showSuccessDialogInTop(String title, String message, BuildContext context) {
  EasyLoading.dismiss();
  CherryToast.success(
      animationCurve: Curves.fastOutSlowIn,

      borderRadius: 10,
      width: Get.width,
      shadowColor: Colors.green.shade100,
      backgroundColor: Colors.green.shade100,
      animationDuration: const Duration(milliseconds: 400),
      toastDuration:const Duration(seconds: 2) ,
      toastPosition:TOAST.Position.top ,
      animationType: TOAST.AnimationType.fromTop,
      description: Text(message,style: const TextStyle(color: Colors.black)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
        maxLines: 2,
      )).show(context);
}

