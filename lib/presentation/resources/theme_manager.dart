import 'package:culture_circle_app_task/presentation/resources/colors_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/fonts_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/styles_manager.dart';
import 'package:culture_circle_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData appThemeManager() {
  return ThemeData(
    // MAIN COLORS OF APP
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.lightGrey, // i.e., for disabled button
    splashColor: ColorManager.lightGrey,

    // APP BAR THEME
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

    // BOTTOM NAVIGATION BAR THEME
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      elevation: AppSizeManager.s10,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.darkGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),

    // INPUT DECORATION THEME
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: ColorManager.lightGrey,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSizeManager.s1, 
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black, 
          width: AppSizeManager.s1,
        ),
      ),
    ),

    // TAB BAR THEME
    tabBarTheme: const TabBarTheme(
      labelColor: ColorManager.black,
      indicatorColor: ColorManager.black,   
    ),

    // ELEVATED BUTTON THEME
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: regularTextStyleManager(color: ColorManager.white),
        backgroundColor: ColorManager.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeManager.s4)),
        elevation: AppSizeManager.s0,
      ),
    ),

    // OUTLINE BUTTON THEME
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorManager.darkGrey, 
          width: AppSizeManager.s1,
        ),
        foregroundColor: ColorManager.black,
      ),
    ),

    expansionTileTheme: const ExpansionTileThemeData(
      textColor: ColorManager.darkGrey,
      iconColor: ColorManager.darkGrey,
      collapsedIconColor: ColorManager.darkGrey,
    ),

    // TEXT THEMES
    textTheme: TextTheme(
      titleLarge: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s20,
      ),
      titleMedium: boldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s20,
      ),
      titleSmall: semiBoldTextStyleManager(
        color: ColorManager.black,
        fontSize: FontSizeManager.s14,
      ),

      // WHITE
      bodyLarge: mediumTextStyleManager(
        color: ColorManager.white,
        fontSize: FontSizeManager.s24,
      ),
      bodyMedium: mediumTextStyleManager(
        color: ColorManager.white,
        fontSize: FontSizeManager.s14,
      ),
      bodySmall: mediumTextStyleManager(
        color: ColorManager.white,
        fontSize: FontSizeManager.s12,
      ),
      displayMedium: mediumTextStyleManager(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
      displaySmall: semiBoldTextStyleManager(
        color: ColorManager.lightGrey,
        fontSize: FontSizeManager.s14,
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
      headlineSmall: semiBoldTextStyleManager(
        color: ColorManager.primary,
        fontSize: FontSizeManager.s14,
      ),
    ),
  );
}
