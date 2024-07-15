// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/widgets/custom_gradient_mask.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.isGradient = false,
    this.style,
    this.textAlign,
    this.gradient,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Gradient? gradient;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return isGradient
        ? CustomGradientMask(
            gradient: gradient,
            child: Text(
              text,
              style: style,
              textAlign: textAlign,
            ),
          )
        : Text(
            text,
            style: style,
            textAlign: textAlign,
          );
  }
}
