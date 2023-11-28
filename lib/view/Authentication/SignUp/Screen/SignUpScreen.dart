import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:netro_creative_interview_work/common/constants/constants.dart';
import 'package:netro_creative_interview_work/common_widget/FormFieldInput.dart';
import 'package:netro_creative_interview_work/view/Authentication/Controller/AuthenticationController.dart';
import 'package:netro_creative_interview_work/view/Authentication/SignUp/Screen/OtpVerifyScreen.dart';

import '../../../../common/tools/Dialog/dialog.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///dependency
    final authController=Get.put(AuthenticationController());
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: theme.textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: Form(
        key: authController.signUpFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/images/Vectorscreen_person.svg',
                        semanticsLabel: 'A red up arrow', height: 100),

                    ///demo other style
                    // CircleAvatar(
                    //   backgroundColor: theme.primaryColor,
                    //   radius: 45,
                    //   child: Icon(
                    //     CupertinoIcons.person_fill,
                    //     size: 60,
                    //     color: theme.scaffoldBackgroundColor,
                    //   ),
                    // )
                    Text(
                      "Welcome Back!",
                      style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Please login to continue",
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),
                    customFormField(
                        'Your Full name',
                        CupertinoTextFormFieldRow(
                          controller: authController.nameController,
                          keyboardType: TextInputType.name,
                          prefix: Icon(CupertinoIcons.person,color: Colors.grey,),

                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                          ),
                          placeholder: 'Mahmud Saimon',
                          validator: (value) {
                            if(value==null ||value.isEmpty){
                              return 'Name Is Required';
                            }
                            return null;
                          },
                        )), customFormField(
                        'Your Email Address',
                        CupertinoTextFormFieldRow(
                          controller: authController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          prefix: Icon(CupertinoIcons.mail,color: Colors.grey,),

                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                          ),
                          placeholder: 'exapmple@domain.com',
                          validator: (value) {
                            if(value==null ||value.isEmpty || !value.contains("@")){
                              return 'Input Valid Email Address';
                            }
                            return null;
                          },
                        )),
                    customFormField(
                        'Password ',
                        CupertinoTextFormFieldRow(
                          controller: authController.passwordController,
                          obscureText: true,
                          prefix: Icon(CupertinoIcons.lock,color: Colors.grey,),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                          ),
                          placeholder: '•••••••••••',
                          validator: (value) {
                            if(value==null ||value.isEmpty || value.length<6){
                              return 'Input Valid Password With 6 Digit';
                            }
                            return null;
                          },
                        )), customFormField(
                        'Confirm Password ',
                        CupertinoTextFormFieldRow(
                          // clearButtonMode: OverlayVisibilityMode.editing,
                          controller: authController.confirmPasswordController,
                          prefix: Icon(CupertinoIcons.lock,color: Colors.grey,),

                          obscureText: true,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                          ),
                          placeholder: '•••••••••••',
                          validator: (value) {
                            if(value==null ||value.isEmpty || value.length<6){
                              return 'Input Valid Password With 6 Digit';
                            }
                            if(value!=authController.passwordController.text){
                              return 'Input Password Doest Not Match';
                            }
                            return null;
                          },
                        )),
                    InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: CupertinoButton(
                            child: Text("Sign up"),
                            onPressed: () {
                              if(authController.signUpFormKey.currentState!.validate()){
                                loadingDialog(context);
                                authController.signUp(context).then((value){
                                  Navigator.pop(context);
                                  if(value){
                                    Get.to(OtpVerifyScreen(email: authController.emailController.text),transition: Transition.rightToLeft);
                                  }
                                });
                              }
                            },
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: .8,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("OR CONTINUE WITH"),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: .8,
                        )),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(googleIcon,height: 30,
                                      semanticsLabel: 'A red up arrow'),
                                  SizedBox(width: 5),

                                  Text('Google')
                                ],
                              )),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(faceBookIcon,height: 30,
                                      semanticsLabel: 'A red up arrow'),
                                  SizedBox(width: 5),
                                  Text('Facebook')
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        // Get.to();
                      },
                      child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Already have an account? ',style: theme.textTheme.titleSmall),
                          TextSpan(text: 'Sign in',style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w700),),
                        ]
                      )),
                    )
                  ],
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
