// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    super.key,
    required this.text,
    this.margin,
    this.onTap,
  });

  String text;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomText(
          text: text,
          style: theme.textTheme.titleMedium,
          isGradient: true,
        ),
      ),
    );
  }
}
