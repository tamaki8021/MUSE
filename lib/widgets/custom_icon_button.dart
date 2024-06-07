import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
    this.isBorderGradient = false,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  final bool isBorderGradient;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: (height ?? 0) + 2,
        width: (width ?? 0) + 2,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Stack(
            alignment: Alignment.center,
            children: [
              isBorderGradient
                  ? Container(
                      height: (height ?? 0) + 2,
                      width: (width ?? 0) + 2,
                      decoration: BoxDecoration(
                        gradient: AppDecoration.appGradient.gradient,
                        borderRadius: BorderRadius.circular(12.h),
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                height: height ?? 0,
                width: width ?? 0,
                padding: padding ?? EdgeInsets.zero,
                decoration: decoration ??
                    BoxDecoration(
                      color: appTheme.gray900,
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                child: child,
              ),
            ],
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of
/// all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillGrayTL27 => BoxDecoration(
        color: appTheme.gray900,
        borderRadius: BorderRadius.circular(27.h),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.white,
        borderRadius: BorderRadius.circular(32.h),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(
          color: appTheme.white,
          width: 2.h,
        ),
      );
  static BoxDecoration get gradientBorderForBackground =>
      AppDecoration.appGradient;
}
