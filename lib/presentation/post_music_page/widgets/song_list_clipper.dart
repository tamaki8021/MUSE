// Flutter imports:
import 'package:flutter/material.dart';

class SongListClipper extends CustomClipper<Path> {
  SongListClipper({required this.screenWidth, this.padding = 0});

  double screenWidth;
  double padding;

  /// Draw a square clip shape
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 2 - screenWidth / 2 + padding, 0)
      ..lineTo(size.width / 2 - screenWidth / 2 + padding, size.height)
      ..lineTo(size.width / 2 + screenWidth / 2 - padding, size.height)
      ..lineTo(size.width / 2 + screenWidth / 2 - padding, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
