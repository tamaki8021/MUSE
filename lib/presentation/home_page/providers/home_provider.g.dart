// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeNotifierHash() => r'f4412ce574f6c70a29dba727ae34ad3faecee2c2';

/// See also [HomeNotifier].
@ProviderFor(HomeNotifier)
final homeNotifierProvider =
    AutoDisposeAsyncNotifierProvider<HomeNotifier, List<PostWithUser>>.internal(
  HomeNotifier.new,
  name: r'homeNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeNotifier = AutoDisposeAsyncNotifier<List<PostWithUser>>;
String _$currentPostWithUserHash() =>
    r'5100306cf76e9b228f991b6470114dbc9a5dcdde';

/// See also [CurrentPostWithUser].
@ProviderFor(CurrentPostWithUser)
final currentPostWithUserProvider = AutoDisposeAsyncNotifierProvider<
    CurrentPostWithUser, PostWithUser?>.internal(
  CurrentPostWithUser.new,
  name: r'currentPostWithUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPostWithUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentPostWithUser = AutoDisposeAsyncNotifier<PostWithUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
