import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/controllers/favorite_controller.dart';
import 'package:hyde/controllers/history_controller.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/screens/app.dart';
import 'package:hyde/screens/account/completed.dart';
import 'package:hyde/screens/document/index.dart';

void main() async {
  runApp(Hyde());
}

class Hyde extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: BackgroundColors.dep1),
        chipTheme: const ChipThemeData(
          backgroundColor: CommonColors.tag,
          labelStyle: TextStyle(color: FontColors.primary),
        ),
        dividerColor: CommonColors.divider,
        scaffoldBackgroundColor: BackgroundColors.dep2,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          accentColor: BrandColors.primary,
        ),
      ),
      initialRoute: '/@:username',
      getPages: [
        _getScreen(
          path: '/@:username',
          screen: App(),
          binding: BindingsBuilder(() {
            Get.put(FavoriteController());
          }),
        ),
        _getScreen(
          path: '/@:username/completed',
          screen: CompletedScreen(),
          binding: BindingsBuilder(() {
            Get.put(HistoryController());
          }),
        ),
        _getScreen(
          path: '/document/:id',
          screen: DocumentScreen(),
        ),
      ],
    );
  }
}

GetPage _getScreen({
  required String path,
  required Widget screen,
  Bindings? binding,
}) {
  return GetPage(
    name: path,
    page: () => screen,
    transition: Transition.topLevel,
    transitionDuration: const Duration(milliseconds: 600),
    binding: binding,
  );
}


/**
 * ?????????????????? ???????????? ?????? ???????
 * - ?????? ??????
 * - ?????? ????????? ?????? ??? ??????
 * - ?????? ????????? ?????? ?????? (????????? ?????? ??? ?????? ????????????)
 * - 
 * 
 * ????????? ?????? ????????? ??????.
 */