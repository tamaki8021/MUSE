// Flutter imports:

// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:outline_gradient_button/outline_gradient_button.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/post_music_page/widgets/needle_widget.dart';
import 'package:muse/presentation/post_music_page/widgets/record_widget.dart';
import 'package:muse/presentation/post_music_page/widgets/song_controller.dart';

class PostMusicPage extends StatefulWidget {
  const PostMusicPage({super.key});

  @override
  PostMusicPageState createState() => PostMusicPageState();
}

class PostMusicPageState extends State<PostMusicPage>
    with TickerProviderStateMixin {
  final double iconSize = 35;
  final Color iconColor = Colors.deepOrangeAccent;
  bool isPlaying = false;

  AnimationController? _needleAnimCtrl;
  AnimationController? _recordAnimCtrl;
  final PageController _pageController = PageController();

  List<String> recordList = [
    'https://picsum.photos/200',
    'https://i.scdn.co/image/ab67616d0000b273efcace231caab71d019a11e2',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200',
  ];
  int currentRecordIndex = 0;

  @override
  void initState() {
    super.initState();
    _recordAnimCtrl = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    _needleAnimCtrl = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
      lowerBound: -0.07,
      upperBound: 0,
    )..addStatusListener(_startRecordAnimation);
  }

  // Starts animating the Record Widget as soon as
  // the needle animation is completed.
  void _startRecordAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _recordAnimCtrl?.repeat();
    }

    if (status == AnimationStatus.reverse) {
      _recordAnimCtrl?.stop();
    }
  }

  @override
  void dispose() {
    _needleAnimCtrl?.dispose();
    _recordAnimCtrl?.dispose();
    super.dispose();
  }

  void _changeToNextRecord() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _changeToPreviousRecord() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return DecoratedBox(
      decoration: AppDecoration.gradientBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          SizedBox(
            height: 35.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: recordList.length,
                  itemBuilder: (context, index) => _buildRecordWidget(
                    recordList[index],
                  ),
                  onPageChanged: (index) {
                    setState(() {
                      currentRecordIndex = index;
                    });
                    if (isPlaying) {
                      _needleAnimCtrl?.reverse();
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    }
                  },
                ),
                _buildNeedleWidget(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 2.h),
                  child: Icon(
                    AppIcons.arrowsRight,
                    color: appTheme.white,
                    size: 5.fSize,
                  ),
                ),
                SizedBox(height: 1.h),
                CustomText(
                  text: 'lbl_choose_post_comment'.tr,
                  style: CustomTextStyles.bodySmallWhite.copyWith(
                    fontSize: 3.fSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'IDOL',
                  style: CustomTextStyles.labelSmallInter.copyWith(
                    fontSize: 7.fSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                CustomText(
                  text: 'アーティスト名',
                  style: CustomTextStyles.bodySmallGray500.copyWith(
                    fontSize: 5.fSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SongController(
            isPlaying: isPlaying,
            onChanged: (p0) {
              setState(() {
                isPlaying = !isPlaying;
              });
              if (isPlaying) {
                _needleAnimCtrl?.forward();
              } else {
                _needleAnimCtrl?.reverse();
              }
            },
            onSkipNextAction: _changeToNextRecord,
            onSkipPreviousAction: _changeToPreviousRecord,
          ),
          const Spacer(),
          OutlineGradientButton(
            gradient: AppDecoration.appGradient.gradient!,
            padding: EdgeInsets.all(2.h),
            strokeWidth: 1,
            radius: const Radius.circular(10),
            child: Center(
              child: CustomText(
                text: 'lbl_POST'.tr,
                isGradient: true,
                style: CustomTextStyles.bodySmallWhite
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: AppbarTitle(
        text: 'lbl_post_music'.tr,
      ),
      centerTitle: true,
      leadingWidth: 10,
      leading: const IconButton(
        icon: CustomGradientMask(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        onPressed: NavigatorService.goBack,
      ),
    );
  }

  Widget _buildRecordWidget(String imagePath) {
    return RotationTransition(
      turns: _recordAnimCtrl!,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: RecordWidget(
          diameter: 70.adaptSize,
          imagePath: imagePath,
        ),
      ),
    );
  }

  Widget _buildNeedleWidget() {
    return Positioned(
      top: -3.h,
      right: 0,
      child: RotationTransition(
        turns: _needleAnimCtrl!,
        // To make the needle swivel around the white circle
        // the alignment is placed placed at the center of the white circle
        alignment: const FractionalOffset(4 / 5, 1 / 6),
        child: NeedleWidget(
          size: 30.h,
        ),
      ),
    );
  }
}
