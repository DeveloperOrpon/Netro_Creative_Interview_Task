import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController{
  ///variable
  final signUpFormKey=GlobalKey<FormState>();

  ///controller
final nameController=TextEditingController();
final emailController=TextEditingController();
final passwordController=TextEditingController();
final confirmPasswordController=TextEditingController();
}