import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData get kDarkTheme => ThemeData(
      //! Main Color
      // primaryColor: AppColors.primary,
      // hintColor: AppColors.hint,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      //!Appbar THeme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      //!ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
        ),
      ),
      //! TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkGrey,
          padding: const EdgeInsets.all(0),
          alignment: AlignmentDirectional.center,
        ),
      ),

      //!OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          //Todo : edit color here
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: Colors.white24,
        ),
      ),
      //! Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
        ),
        displayLarge: TextStyle(
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
        ),
      ),

      //! InputDecoration Theme
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppColors.white,
        contentPadding: const EdgeInsets.all(16),
        hintStyle: const TextStyle(
          color: AppColors.white,
          // fontFamily: AppFonts.,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        iconColor: AppColors.primary,
        prefixIconColor: AppColors.primary,
        errorStyle: const TextStyle(color: AppColors.error),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: const OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      //!Bottom Nav Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.red,
      ),
      //! Chip Theme
      chipTheme: const ChipThemeData(),

      //!Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
    );
