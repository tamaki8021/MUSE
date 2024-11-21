// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
    required this.rightLabel,
    required this.leftLabel,
  });

  final String rightLabel;
  final String leftLabel;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: TabBar(
        labelStyle: CustomTextStyles.bodySmallWhite.copyWith(
          fontSize: 4.5.fSize,
          fontWeight: FontWeight.w800,
          // color: appTheme.brandColor,
        ), // 選択されたタブのテキストスタイル
        unselectedLabelStyle: CustomTextStyles.bodySmallWhite.copyWith(
          fontSize: 3.fSize,
          fontWeight: FontWeight.w600,
          color: Colors.white70.withOpacity(0.3),
        ), // 選択されていないタブのテキストスタイル
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: GradientTabIndicator(
          gradient: AppDecoration.appGradient.gradient!,
          thickness: 2,
        ),
        tabs: [
          Tab(child: CustomText(text: leftLabel, isGradient: true)),
          Tab(child: CustomText(text: rightLabel, isGradient: true)),
        ],
      ),
    );
  }
}

class GradientTabIndicator extends Decoration {
  GradientTabIndicator({
    required Gradient gradient,
    required double thickness,
    double radius = 0,
  }) : _painter = _GradientPainter(
          gradient: gradient,
          thickness: thickness,
          radius: radius,
        );

  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _GradientPainter extends BoxPainter {
  _GradientPainter({
    required this.gradient,
    required this.thickness,
    this.radius,
  });

  final Gradient gradient;
  final double thickness;
  final double? radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = Offset(offset.dx, configuration.size!.height - thickness) &
        Size(configuration.size!.width, thickness);
    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }
}
