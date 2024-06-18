import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

class CircleProgressBarPainter extends CustomPainter {
  CircleProgressBarPainter({double progress = 0})
      : progress = progress > 1 ? 1 : progress;

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    // 外側の円を描画するためのPaintオブジェクトを作成します
    final outerCircle = Paint()
      ..strokeWidth = 6 // 線の幅を10に設定します
      ..color = Colors.grey.withOpacity(0.9) // 色を半透明の灰色に設定します
      ..style = PaintingStyle.stroke; // 描画スタイルをストローク（線）に設定します

    // 完了部分の円弧を描画するためのPaintオブジェクトを作成します
    final completeArc = Paint()
      ..strokeWidth = 6 // 線の幅を10に設定します
      // ..color = appTheme.brandColor
      ..shader = SweepGradient(
        endAngle: 2 * 3.14,
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.secondary,
          appTheme.brandColor,
          appTheme.deepOrange400,
          theme.colorScheme.primary,
        ], // グラデーションの色を指定します
        stops: const [0.0, 0.2, 0.6, 0.9, 1.0], // 各色の位置を指定します
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), // 円の中心を指定します
          radius: size.width / 2, // 円の半径を指定します
        ),
      )
      ..style = PaintingStyle.stroke // 描画スタイルをストローク（線）に設定します
      ..strokeCap = StrokeCap.round; // 線の端を丸く設定します

    // 円の中心の座標を計算します
    final center = Offset(size.width / 2, size.height / 2);
    // 円の半径を計算します
    final radius = size.width / 2;

    // 外側の円を描画します
    // canvas.drawCircle(center, radius, outerCircle);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14 / 1.34, // 開始角度をラジアンで指定します（ここでは約120度）
      3 * 3.14 / 2, // 描写する円弧の長さをラジアンで指定します（ここでは約270度）
      false, // 扇形ではなく円弧を描写します
      outerCircle, // 描写に使用するPaintオブジェクトを指定します
    );
    // 進行状況を表す値を計算します
    final angle = 3 * 3.14 / 2 * progress;
    // 完了部分の円弧を描画します
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14 / 1.34,
      angle,
      false,
      completeArc,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    /// 以前の描画内容と異なる場合にtrueを返します
    if (oldDelegate is CircleProgressBarPainter) {
      return oldDelegate.progress != progress;
    }
    return false;
  }
}
