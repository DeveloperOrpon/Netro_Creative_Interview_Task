import 'dart:convert';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:netro_creative_interview_work/common/tools/Dialog/dialog.dart';
import 'package:netro_creative_interview_work/service/cache_stroage/localStroage.dart';
import 'package:netro_creative_interview_work/view/Authentication/Login/Screen/SignInScreen.dart';
import 'package:netro_creative_interview_work/view/Home/Screen/HomeScreen.dart';

import '../../../service/Interceptors/ConnectivityRequestRetrier.dart';
import '../../../service/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../../../service/api_route.dart';

class AuthenticationController extends GetxController{
  ///variable
  final signUpFormKey=GlobalKey<FormState>();
  final signInFormKey=GlobalKey<FormState>();

  ///controller
final nameController=TextEditingController();
final emailController=TextEditingController();
final passwordController=TextEditingController();
final confirmPasswordController=TextEditingController();
  final passwordControllerSignIn=TextEditingController();
  final emailControllerSignIn=TextEditingController();
late DIO.Dio dio;
String OTP='';
  @override
  void onInit() {
    ///connection init
    DIO.BaseOptions options = DIO.BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2));
    dio = DIO.Dio(options);
    // _dio.interceptors.add(RetryInterceptor(dio: _dio));
    dio.interceptors.add(RetryOnConnectionChangeInterceptor(
        requestRetrier:
        ConnectiveRequestRetrier(connectivity: Connectivity(), dio: dio)));
    super.onInit();
  }
//create User
Future<bool>  signUp(BuildContext context) async {

    Map<String,dynamic> userMap={
      "name": nameController.text.trim(),
      "email":  emailController.text.trim(),
      "password":  passwordController.text.trim(),
      "password_confirmation":  confirmPasswordController.text.trim()
    };
    try {
      final DIO.Response response = await dio.post(SIGN_UP,data:DIO.FormData.fromMap(userMap) );
      log("Server Data : ${response.data} ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> serverJSON = response.data;
        OTP=serverJSON['otp'].toString();
        showSuccessDialogInTop("Information", "OTP Sent On Your Mail", context);
       return true;
      }
      return false;
    } on DIO.DioException catch (e) {
      log("Error signUp: ${e.toString()}: ${e.requestOptions.baseUrl}${e.requestOptions.path}");
      return false;
    }
  }

  Future<bool>  checkOTPCreateAccount(BuildContext context,String otp) async {
    Map<String,dynamic> userMap={
      "name": nameController.text.trim(),
      "email":  emailController.text.trim(),
      "Password":  passwordController.text.trim(),
      "temp_otp":OTP,
      "otp_code":"$otp"
    };
    log("Map: ${userMap}");
    try {
      final DIO.Response response = await dio.post(OTP_VERIFY,data:DIO.FormData.fromMap(userMap) );
      log("Server Data : ${response.data} ${response.statusCode}");
      if (response.statusCode == 201) {
        // Map<String, dynamic> serverJSON = response.data;
        showSuccessDialogInTop("Information", "User Successfully Created", context);
        Get.offAll(SignInScreen(),transition: Transition.fadeIn);
       return true;
      }
      return false;
    } on DIO.DioException catch (e) {
      log("Error checkOTPCreateAccount: ${e.toString()}: ${e.requestOptions.baseUrl}${e.requestOptions.path}");
      return false;
    }
  }
  Future<bool>  signIn(BuildContext context) async {
    EasyLoading.show(status: 'Wait...');
    Map<String,dynamic> userMap={
      "email":  emailControllerSignIn.text.trim(),
      "password":  passwordControllerSignIn.text.trim(),
    };
    log("Map: ${userMap}");
    try {
      final DIO.Response response = await dio.post(SIGN_IN,data:DIO.FormData.fromMap(userMap) );
      log("Server Data : ${response.data} ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> serverJSON = response.data;
        String jsonString = json.encode(serverJSON);
        LocalStorage.savedUserInformation(jsonString);
        showSuccessDialogInTop("Information", "Login Successfully", context);
        Get.offAll(HomeScreen(),transition: Transition.fadeIn);
        return true;
      }
      return false;
    } on DIO.DioException catch (e) {
      Navigator.pop(context);
      log("Error signUp: ${e.toString()}: ${e.requestOptions.baseUrl}${e.requestOptions.path}");
      return false;
    }
  }
///method
  logout(){}

}