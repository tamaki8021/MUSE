// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/presentation/post_music_page/widgets/record_widget.dart';

class RecordHorizontalList extends StatelessWidget {
  const RecordHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView(
          itemExtent: 100,
          physics: const FixedExtentScrollPhysics(),
          children: List<Widget>.generate(
            20,
            (index) => const RotatedBox(
              quarterTurns: 1,
              child: RecordWidget(diameter: 100),
            ),
          ),
        ),
      ),
    );
  }
}
