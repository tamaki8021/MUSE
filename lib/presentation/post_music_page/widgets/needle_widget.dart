// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class NeedleWidget extends StatelessWidget {
  const NeedleWidget({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgNeedle,
      height: size,
    );
  }
}
