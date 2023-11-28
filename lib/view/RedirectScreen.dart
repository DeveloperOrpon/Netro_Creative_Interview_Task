import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netro_creative_interview_work/view/Authentication/Login/Screen/SignInScreen.dart';
import 'package:netro_creative_interview_work/view/Home/Screen/HomeScreen.dart';

import '../common/constants/constants.dart';
import '../service/cache_stroage/localStroage.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),() async {
      String? userMapString=await LocalStorage.getUserInformation();
      if(userMapString==null || userMapString.isEmpty){
        Get.offAll(SignInScreen(),transition: Transition.rightToLeftWithFade  );

      }else{
        Get.offAll(HomeScreen(),transition: Transition.rightToLeftWithFade  );

      }

    },);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
        ),
      ),
      body: Image.asset(
        appSplashUrl,
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
