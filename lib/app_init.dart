import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netro_creative_interview_work/common/theme/light_theme.dart';
import 'package:netro_creative_interview_work/screen/RedirectScreen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netro Creative',
      theme: ThemeData(
        colorScheme: buildLightTheme(language),
        useMaterial3: true,
      ),
      home: const RedirectScreen(),
    );
  }
}