// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CustomInputImage extends HookConsumerWidget {
  const CustomInputImage({Key? key, this.radius = 60}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picker = ImagePicker();
    final image = useState<String>('');

    Future<void> addImage() async {
      if (image.value.isNotEmpty) {
        image.value = '';
      }

      final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        image.value = pickedImage.path;
      }
    }

    return Ink(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: addImage,
          child: image.value.isEmpty
              ? CircleAvatar(
                  radius: radius,
                  backgroundColor: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(
                      Icons.person_outline_sharp,
                      color: Colors.grey,
                      size: 100,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: radius,
                  backgroundImage: FileImage(File(image.value)),
                ),
        ),
      ),
    );
  }
}
