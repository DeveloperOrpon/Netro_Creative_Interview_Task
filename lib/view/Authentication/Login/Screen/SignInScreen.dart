import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:netro_creative_interview_work/common/constants/constants.dart';
import 'package:netro_creative_interview_work/common_widget/FormFieldInput.dart';
import 'package:netro_creative_interview_work/screen/Authentication/SignUp/Screen/SignUpScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: theme.textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/images/Vectorscreen_person.svg',
                      semanticsLabel: 'A red up arrow', height: 120),

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
                  const SizedBox(height: 40),
                  customFormField(
                      'Your Email Address',
                      CupertinoTextFormFieldRow(
                        prefix: Icon(CupertinoIcons.mail,color: Colors.grey,),

                        keyboardType: TextInputType.emailAddress,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        placeholder: 'exapmple@domain.com',
                      )),
                  customFormField(
                      'Password ',
                      CupertinoTextFormFieldRow(
                        prefix: Icon(CupertinoIcons.lock,color: Colors.grey,),

                        obscureText: true,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        placeholder: '•••••••••••',
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
                          child: Text("Sign in"),
                          onPressed: () {},
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
                      Get.to(SignUpScreen(),transition: Transition.rightToLeft );
                    },
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Don’t have any account? ',style: theme.textTheme.titleSmall),
                        TextSpan(text: 'Register Now ',style: theme.textTheme.titleMedium!.copyWith(
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
    );
  }
}
