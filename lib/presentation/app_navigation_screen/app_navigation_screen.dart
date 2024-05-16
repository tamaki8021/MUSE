import 'package:flutter/material.dart';
import 'package:muse/core/app_export.dart';

class AppNavigationScreen extends ConsumerStatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
}

class AppNavigationScreenState extends ConsumerState<AppNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0XFFFFFFFF),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          'App Navigation'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0XFF000000),
                            fontSize: 20.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "Check your app's UI from the below "
                                  'demo screens of your app.'
                              .tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0XFF888888),
                            fontSize: 16.fSize,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Divider(
                      height: 1.v,
                      thickness: 1.v,
                      color: const Color(0XFF000000),
                    ),
                  ],
                ),
              ),
              _buildGroupAP12(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroupAP12(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0XFFFFFFFF),
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0XFFFFFFFF),
            ),
            child: Column(
              children: [
                SizedBox(height: 10.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Text(
                      'street pass'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0XFF000000),
                        fontSize: 20.fSize,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                SizedBox(height: 5.v),
                Divider(
                  height: 1.v,
                  thickness: 1.v,
                  color: const Color(0XFF888888),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
