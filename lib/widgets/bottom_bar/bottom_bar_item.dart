// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isSelected
          ? CustomGradientMask(
              child: Icon(
                icon,
                color: appTheme.white,
                size: 6.adaptSize,
              ),
            )
          : Icon(icon, color: appTheme.white),
    );
  }
}
