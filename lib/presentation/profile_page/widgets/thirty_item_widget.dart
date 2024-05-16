import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

import '../models/thirty_item_model.dart';

// ignore: must_be_immutable
class ThirtyItemWidget extends StatelessWidget {
  ThirtyItemWidget(
    this.thirtyItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ThirtyItemModel thirtyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.h,
      child: CustomImageView(
        imagePath: thirtyItemModelObj.xbb,
        height: 170.adaptSize,
        width: 170.adaptSize,
      ),
    );
  }
}
