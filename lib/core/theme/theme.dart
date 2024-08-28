import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app_marvels/core/utils/constants.dart';

enum AppTheme { dark, light }

final Map<AppTheme, ThemeData> kAppThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    primaryColor: kPrimaryBlue,
    scaffoldBackgroundColor: kBackgroundColor,
    canvasColor: kBackgroundColor,
    iconTheme: const IconThemeData(
      color: kWhite,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: kBackgroundColor,
        contentTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kBlack,
        )),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
      ),
      elevation: 0.0,
      surfaceTintColor: kBackgroundColor,
      shadowColor: Colors.transparent,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return kBlack;
          }
          return Colors.white;
        },
      ),
    ),
    textTheme: GoogleFonts.manropeTextTheme(
      const TextTheme().copyWith(
        displayLarge: GoogleFonts.manrope(
          fontSize: 24.sp,
          fontWeight: FontWeight.w800,
          color: kBlack,
        ),
        displayMedium: GoogleFonts.manrope(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: kBlack,
        ),
        displaySmall: GoogleFonts.manrope(
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
          color: kBlack,
        ),
        headlineMedium: GoogleFonts.manrope(
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          color: kBlack,
        ),
        headlineSmall: GoogleFonts.manrope(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: kLightBlack,
        ),
        titleLarge: GoogleFonts.manrope(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: kDarkGray,
        ),
        titleMedium: GoogleFonts.manrope(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: kLightBlack,
        ),
        bodyLarge: GoogleFonts.manrope(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: kDarkGray,
        ),
        bodyMedium: GoogleFonts.manrope(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: kLightBlack,
        ),
        bodySmall: GoogleFonts.manrope(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: kLightBlack,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          const StadiumBorder(),
        ),
        backgroundColor: WidgetStateProperty.all(kPrimaryBlue),
        foregroundColor: WidgetStateProperty.all(kBlack),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(kPrimaryBlue),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.manrope(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: kBlack,
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kBackgroundColor,
      showUnselectedLabels: true,
      selectedItemColor: kBlack,
      selectedIconTheme: IconThemeData(
        color: kBlack,
        size: 24.sp,
      ),
      unselectedItemColor: kDarkGray,
      unselectedIconTheme: IconThemeData(
        color: kDarkGray,
        size: 24.sp,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: kBackgroundColor,
      surfaceTintColor: kBackgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: const IconThemeData(
        color: kBlack,
      ),
      titleTextStyle: GoogleFonts.manrope(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: kBlack,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(kWhite),
        surfaceTintColor: WidgetStateProperty.all(kWhite),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    ),
    dialogTheme: const DialogTheme(
      surfaceTintColor: kWhite,
      backgroundColor: kWhite,
    ),
    inputDecorationTheme: InputDecorationTheme(
      constraints: BoxConstraints(
        minHeight: 49.h,
      ),
      filled: true,
      fillColor: kLightestGray,
      hintStyle: GoogleFonts.manrope(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: kDarkGray,
      ),
      helperStyle: GoogleFonts.manrope(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: kDarkGray,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: kPrimaryBlue, width: 1.w),
      ),
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
        highlightColor: kWhite,
        splashColor: kWhite,
        focusColor: kWhite,
        hoverColor: kWhite),
    outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: WidgetStateColor.transparent,
            surfaceTintColor: WidgetStatePropertyAll(kWhite))),
    highlightColor: kWhite,
    splashColor: kWhite,
    focusColor: kWhite,
    hoverColor: kWhite,
    buttonTheme: const ButtonThemeData(
        splashColor: kWhite,
        hoverColor: kWhite,
        focusColor: kWhite,
        highlightColor: kWhite),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: kPrimaryBlue,
      onPrimary: kBlack,
      secondary: kWhite,
      onSecondary: kBlack,
      surface: kLightestGray,
      onSurface: kBlack,
      error: kErrorColor,
      onError: kWhite,
    ),
  )
};
