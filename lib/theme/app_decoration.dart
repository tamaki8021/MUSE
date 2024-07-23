// ignore_for_file: avoid_classes_with_only_static_members

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900.withOpacity(0.5),
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillGray90001Circle20 => BoxDecoration(
        color: appTheme.gray90001,
        borderRadius: BorderRadius.circular(20.adaptSize),
      );

  // Gradient decorations
  static BoxDecoration get gradientProfileImageBg => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0, 0.5),
          end: const Alignment(1, 0.5),
          colors: [
            appTheme.deepOrange400,
            appTheme.deepPurpleA200,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleAToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-0.06, -0.2),
          end: const Alignment(1.37, 0.82),
          colors: [
            appTheme.purpleA200,
            appTheme.purple800,
            appTheme.black900,
          ],
        ),
      );

  static BoxDecoration get appGradient => BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );

  static BoxDecoration get gradientBackground => BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 2,
          colors: [
            appTheme.purpleBgStop1,
            appTheme.purpleBgStop2,
            appTheme.black900,
          ],
          stops: const [0, 0.55, 0.9],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray800,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineWhite => BoxDecoration(
        border: Border.all(
          color: appTheme.white,
          width: 0.5.adaptSize,
        ),
      );
}

class InputBorderStyle {
  static InputBorder get outlinedBorderWhite => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.white,
        ),
      );

  static InputBorder get outlinedBorderWhiteCircle10 => OutlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.white,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static InputBorder get outlinedBorderPrimaryCircle10 => OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder18 => BorderRadius.circular(
        18.h,
      );
  static BorderRadius get circleBorder23 => BorderRadius.circular(
        23.h,
      );
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder39 => BorderRadius.circular(
        39.h,
      );
  static BorderRadius get circleBorder43 => BorderRadius.circular(
        43.h,
      );
  static BorderRadius get circleBorder48 => BorderRadius.circular(
        48.h,
      );
  static BorderRadius get circleBorder94 => BorderRadius.circular(
        94.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
