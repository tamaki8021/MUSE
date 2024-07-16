// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:muse/core/app_export.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({
    Key? key,
    required this.diameter,
  })
  // : file = File(albumArt),
  : super(key: key);

  // RecordWidget.largeImage({Key? key, @required this.diameter, @required this.albumArt})
  //     : file = File(albumArt),
  //       large = true, super(key: key);
  final double diameter;
  // final File file;
  // final bool large;

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

          // Check that the album art is not null
          // before building it
          // file.path == 'null'
          //     ? const Center()
          //     : Center(
          //         child: Container(
          //           width: diameter / 2.5,
          //           height: diameter / 2.5,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             image: DecorationImage(
          //               image: FileImage(
          //                 file,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          Center(
            child: Container(
              width: diameter / 20,
              height: diameter / 20,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
