// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';
import 'package:muse/presentation/post_music_page/widgets/needle_widget.dart';
import 'package:muse/presentation/post_music_page/widgets/record_widget.dart';
import 'package:muse/presentation/post_music_page/widgets/song_list_clipper.dart';

class PostMusicPage extends StatefulWidget {
  const PostMusicPage({Key? key}) : super(key: key);

  @override
  _CurrentPlayingPageState createState() => _CurrentPlayingPageState();
}

class _CurrentPlayingPageState extends State<PostMusicPage>
    with TickerProviderStateMixin {
  final double iconSize = 35;
  final Color iconColor = Colors.deepOrangeAccent;

  AnimationController? _needleAnimCtrl;
  AnimationController? recordAnimCtrl;
  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    print('start');

    recordAnimCtrl = AnimationController(
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
    print(status);
    if (status == AnimationStatus.completed) recordAnimCtrl?.repeat();
    if (status == AnimationStatus.reverse) recordAnimCtrl?.stop();
  }

  @override
  void dispose() {
    print('done');
    _needleAnimCtrl?.dispose();
    recordAnimCtrl?.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: CustomAppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  _needleAnimCtrl?.forward();
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {
                  _needleAnimCtrl?.reverse();
                },
              ),
            ],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildRecordWidget(),
              _buildNeedleWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecordWidget() {
    return Positioned(
      top: 12.h,
      child: GestureDetector(
        child: RotationTransition(
          turns: recordAnimCtrl!,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Hero(
              tag: 'widget.album.id',
              child: RecordWidget(
                diameter: 70.adaptSize,
              ),
            ),
          ),
        ),
        onDoubleTap: () => _showSongsList(context),
      ),
    );
  }

  Widget _buildNeedleWidget() {
    return Positioned(
      top: 6.h,
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

  void _showSongsList(BuildContext context) {
    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onHorizontalDragUpdate: (_) => _removeOverlay(),
          child: ClipPath(
            clipper: SongListClipper(
              screenWidth: MediaQuery.of(context).size.width,
              padding: 8,
            ),
            child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width + 100.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width + 100.0,
                child: _buildSongList(context),
              ),
            ),
          ),
        ),
      ),
    );
    _overlayState?.insert(_overlayEntry!);
  }

  Widget _buildSongList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ColoredBox(
        color: theme.primaryColor,
        child: const Text('song title'),
      ),
    );
  }

  void _removeOverlay() => _overlayEntry?.remove();
}
