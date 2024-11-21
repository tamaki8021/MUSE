// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:muse/data/models/user.dart';

part 'user_provider.g.dart';

@riverpod
User user(UserRef ref) {
  return const User(
    userId: '1',
    name: 'Jone done',
    bio: 'bio',
  );
}
