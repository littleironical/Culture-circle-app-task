import 'package:culture_circle_app_task/presentation/resources/colors_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/fonts_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/styles_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData appThemeManager() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.lightGrey, // i.e., for disabled button
    splashColor: ColorManager.primary,

    // appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.white,
      centerTitle: true,
      elevation: AppSizeManager.s4,
      shadowColor: ColorManager.grey,
      iconTheme: const IconThemeData(
        color: ColorManager.black,
        size: AppSizeManager.s30,
      ),
      titleTextStyle: regularTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s16,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      elevation: AppSizeManager.s10,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.darkGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: regularTextStyleManager(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManager.s10)),
        elevation: AppSizeManager.s0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: regularTextStyleManager(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManager.s10)),
        disabledBackgroundColor: ColorManager.white,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleLarge: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s20,
      ),
      titleMedium: mediumTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s18,
      ),
      titleSmall: mediumTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s14,
      ),
      bodyLarge: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s24,
      ),
      bodyMedium: mediumTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s16,
      ),
      bodySmall: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s12,
      ),
      displayMedium: mediumTextStyleManager(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
      labelSmall: mediumTextStyleManager(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s12,
      ),
      labelMedium: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s16,
      ),
      labelLarge: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s24,
      ),
    ),
  );
}
