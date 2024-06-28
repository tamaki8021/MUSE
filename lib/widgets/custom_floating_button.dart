import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.adaptSize,
      width: 16.adaptSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(ImageConstant.imgFloatingActionButtonBgImg),
          fit: BoxFit.cover,
        ),
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        onPressed: () {
          NavigatorService.pushNamed(AppRoutes.postPage);
        },
        child: Center(
          child: Icon(
            Icons.add,
            size: 6.adaptSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
