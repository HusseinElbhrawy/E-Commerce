import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData get kLightTheme => ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      hintColor: AppColors.grey,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.grey.shade100,
      //!Appbar
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      //!TextTheme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          color: Colors.black,
        ),
        //? Used with BigText
        headlineSmall: TextStyle(
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          color: Colors.black,
        ),
        displayLarge: TextStyle(
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
        //? Used with SmallText
        bodyMedium: TextStyle(
          color: Colors.black,
        ),
        //? Used To Custom Text Color with any Widget
        bodySmall: TextStyle(
          color: Colors.white,
        ),
      ),

      //! TFF Theme
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppColors.grey,
        contentPadding: const EdgeInsets.all(16),
        hintStyle: TextStyle(
          color: AppColors.grey,
          // fontFamily: AppFonts.jannah,
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        iconColor: AppColors.primary,
        prefixIconColor: AppColors.primary,
        errorStyle: const TextStyle(color: AppColors.error),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      //! TextButton THeme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
        ),
      ),

      //! Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
      ),

      //! Bottom Nav Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        elevation: 100,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.black,
        selectedIconTheme: IconThemeData(
          color: AppColors.black,
          grade: 1.0,
          fill: 1.0,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.black,
          grade: 0.2,
          fill: 0.0,
        ),
      ),

      //!ElevatedButtonTheme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
        ),
      ),
    );
