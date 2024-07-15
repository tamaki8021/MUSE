// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class CustomGradientMask extends StatelessWidget {
  const CustomGradientMask({
    Key? key,
    required this.child,
    this.gradient,
  }) : super(key: key);
  final Widget child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          (gradient ?? AppDecoration.appGradient.gradient!)
              .createShader(bounds),
      child: child,
    );
  }
}
