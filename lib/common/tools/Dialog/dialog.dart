import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart' as TOAST;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

authenticationErrorDialog(String title, String message) {
  EasyLoading.dismiss();
  Get.snackbar(title, message,
      backgroundColor: Colors.red.shade200,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.vertical,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 15.5,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            height: Get.height * .1,
          ),
          const SizedBox(
            width: 2.5,
          ),
          const Icon(
            Icons.info_outline_rounded,
            color: Colors.white,
          )
        ],
      ),
      colorText: Colors.white,
      barBlur: 2.0,
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      borderRadius: 5);
}

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
      style: const TextStyle(fontWeight: FontWeight.normal),
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
      description: Text(message,style: const TextStyle(color: Colors.white)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.normal),
        maxLines: 2,
      )).show(context);
}
loadingDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return const Center(child: CupertinoActivityIndicator(color: Color(0xFF3498DB),radius: 25),);
      }
  );
}
