// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

class MusicCoverGridView extends StatelessWidget {
  const MusicCoverGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrls = List.generate(
      30,
      (index) => 'https://picsum.photos/seed/$index/200/200',
    );

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          imageUrl: imageUrls[index],
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
