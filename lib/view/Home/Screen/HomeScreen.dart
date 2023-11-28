import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:netro_creative_interview_work/view/RedirectScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            await preferences.clear();
            Get.offAll(RedirectScreen(),transition: Transition.fadeIn);
          }, icon: Icon(Icons.login))
        ],
      ),
      extendBody: true,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            borderColor: Colors.red,

            backgroundColor: Colors.white,
            title: const Text('Home'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            // selectedColor: Colors.teal,
            backgroundColor: Colors.white,
            title: const Text('Home'),
          ),

        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex:  0,
        onTap: (index) {

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: Colors.white,
        child: Icon(
         CupertinoIcons.star_fill,
          color: Theme.of(context).primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: PageView(
          children: const [
            Center(child: Text('Home')),
            Center(child: Text('Star')),
            Center(child: Text('Style')),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}
