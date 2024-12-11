// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:muse/data/repositories/auth_repository.dart';

final authStateProvider = StreamProvider<User?>(
  (ref) => ref.watch(authRepositoryProvider).authStateChanged,
);

final isSignedInProvider = FutureProvider(
  (ref) async {
    final user = await ref.watch(authStateProvider.future);
    return user != null;
  },
);
