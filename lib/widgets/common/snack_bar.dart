// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

void openSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  Color? textColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: CustomTextStyles.bodySmallWhite,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor ?? Colors.red,
    ),
  );
}
