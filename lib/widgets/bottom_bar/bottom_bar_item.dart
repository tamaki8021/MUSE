import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

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
