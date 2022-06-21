import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/controllers/tab_page_controller.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/screens/account/index.dart';
import 'package:hyde/screens/discover/index.dart';

class App extends StatelessWidget {
  final controller = Get.put(TabPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              AccountScreen(),
              DiscoverScreen(),
            ],
          )),
      bottomNavigationBar: Obx(() => _buildBottomNavigation(controller)),
    );
  }

  Widget _buildBottomNavigation(TabPageController controller) {
    return BottomNavigationBar(
      // styles
      elevation: 0,
      backgroundColor: BackgroundColors.dep1,
      selectedIconTheme: const IconThemeData(color: FontColors.primary),
      unselectedIconTheme: const IconThemeData(color: FontColors.secondary),

      // control
      iconSize: 24,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.tabIndex.value,
      onTap: controller.changeTabIndex,

      // build
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FlutterRemix.user_fill),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(FlutterRemix.compass_fill),
          label: "탐색",
        ),
        BottomNavigationBarItem(
          icon: Icon(FlutterRemix.bar_chart_fill),
          label: "라이브러리",
        ),
      ],
    );
  }
}
