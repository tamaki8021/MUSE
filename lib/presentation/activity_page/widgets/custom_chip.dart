// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.iconData,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: ChoiceChip(
        avatar: CustomGradientMask(
          child: Icon(
            iconData,
            color: appTheme.white,
            size: 6.adaptSize,
          ),
        ),
        label: CustomText(
          isGradient: true,
          text: label,
          style: CustomTextStyles.labelSmallInter.copyWith(fontSize: 5.fSize),
        ),
        selected: isSelected,
        showCheckmark: false,
        onSelected: onSelected,
        selectedColor: appTheme.white,
        backgroundColor: Colors.transparent,
        side: BorderSide(color: appTheme.white.withOpacity(0.3)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.adaptSize),
        ),
      ),
    );
  }
}
