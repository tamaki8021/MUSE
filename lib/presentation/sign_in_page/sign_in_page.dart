// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/data/repositories/auth_repository.dart';
import 'package:muse/widgets/common/snack_bar.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    Future<void> handleSignIn() async {
      isLoading.value = true;
      try {
        await ref.read(authRepositoryProvider).spotifySignIn();
      } on Exception catch (_) {
        openSnackBar(
          context: context,
          message: 'ログインに失敗しました',
          backgroundColor: appTheme.black900,
        );
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeUtils.height,
            width: SizeUtils.width,
            decoration: AppDecoration.fillGray900,
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imageMuseLogo,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                ),
                CustomText(
                  text: 'lbl_welcome_to_muse'.tr,
                  isGradient: true,
                  style: CustomTextStyles.labelLargeInter.copyWith(
                    fontSize: 7.fSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                CustomText(
                  text: 'msg_welcome'.tr,
                  style: CustomTextStyles.bodySmallWhite,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                OutlineGradientButton(
                  strokeWidth: 1,
                  gradient: AppDecoration.appGradient.gradient!,
                  radius: const Radius.circular(20),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.adaptSize,
                  ),
                  onTap: handleSignIn,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        AppIcons.logosSpotifyIcon,
                        color: Colors.green,
                      ),
                      SizedBox(width: 3.w),
                      CustomText(
                        text: 'lbl_sign_in_with_spotify'.tr,
                        style: CustomTextStyles.labelLargeInter.copyWith(
                          fontSize: 4.5.fSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: 'By signing up, you are creating a MUSE account'
                            ' and agree to MUSE’s ',
                      ),
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                    style:
                        TextStyle(color: appTheme.white, fontSize: 3.5.fSize),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
              ],
            ),
          ),
          // ローディングインジケーターの追加
          if (isLoading.value)
            ColoredBox(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
