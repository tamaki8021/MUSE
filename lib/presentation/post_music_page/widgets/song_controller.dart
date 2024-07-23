// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class SongController extends HookConsumerWidget {
  const SongController({
    Key? key,
    required this.isPlaying,
    required this.onChanged,
  }) : super(key: key);

  final bool isPlaying;
  final FutureOr<void> Function(bool)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 2.h),
      child: Row(
        children: [
          AnimatedToggleSwitch<bool>.dual(
            current: isPlaying,
            first: false,
            second: true,
            style: const ToggleStyle(
              borderColor: Colors.transparent,
            ),
            borderWidth: 5,
            height: 7.h,
            // onChanged: (b) => isPlaying.value = !isPlaying.value,
            onChanged: onChanged,
            styleBuilder: (b) => ToggleStyle(
              backgroundGradient: b ? null : AppDecoration.appGradient.gradient,
              backgroundColor: b ? Colors.white70 : null,
              indicatorColor: appTheme.white,
            ),
            iconBuilder: (value) => value
                ? const Icon(Icons.pause)
                : CustomGradientMask(
                    child: Icon(
                      Icons.play_circle,
                      color: appTheme.white,
                    ),
                  ),
            textBuilder: (value) => value
                ? Center(
                    child: CustomText(
                      text: 'lbl_stop'.tr,
                      style: CustomTextStyles.bodySmallWhite.copyWith(
                        fontSize: 5.fSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : Center(
                    child: CustomText(
                      text: 'lbl_play'.tr,
                      style: CustomTextStyles.bodySmallWhite.copyWith(
                        fontSize: 5.fSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ),
          const Spacer(),
          _buildIconButton(Icons.skip_previous, () {}),
          _buildIconButton(Icons.skip_next, () {}),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: CustomIconButton(
        onTap: onTap,
        height: 7.h,
        width: 7.h,
        decoration: AppDecoration.fillGray90001Circle20,
        child: CustomGradientMask(
          child: Icon(
            icon,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }
}
