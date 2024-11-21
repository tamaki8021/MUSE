// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({
    super.key,
    required this.diameter,
    required this.imagePath,
  });

  final double diameter;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: diameter,
      height: diameter,
      child: Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRecord,
            width: diameter,
            height: diameter,
            fit: BoxFit.fill,
          ),
          imagePath.isEmpty
              ? const Center()
              : Center(
                  child: Container(
                    width: diameter / 2.5,
                    height: diameter / 2.5,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
          imagePath.isEmpty
              ? const Center()
              : Center(
                  child: Container(
                    width: diameter / 2.5,
                    height: diameter / 2.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imagePath),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
