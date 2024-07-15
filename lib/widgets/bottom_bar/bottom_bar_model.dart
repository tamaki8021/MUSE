// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'custom_bottom_bar.dart';

class BottomBarModel {
  BottomBarModel({
    required this.icon,
    required this.type,
  });

  IconData icon;
  BottomBarEnum type;
}
