// ignore_for_file: lines_longer_than_80_chars,avoid_classes_with_only_static_members, unused_element

import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static TextStyle get bodyMediumBluegray300 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray300,
      );
  static TextStyle get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
      );
  static TextStyle get bodySmallWhite => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.white,
      );
  // Label style
  static TextStyle get labelLargeInter => theme.textTheme.labelLarge!.inter;
  // Title text style
  static TextStyle get titleMediumGray90002 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumMedium =>
      theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumMedium18 =>
      theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallSemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallYellow900 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.yellow900,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
