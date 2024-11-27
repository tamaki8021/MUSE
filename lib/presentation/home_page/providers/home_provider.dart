// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:muse/data/models/post.dart';
import 'package:muse/data/models/user.dart';
import 'package:muse/presentation/home_page/state/home_state.dart';

part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  Future<List<PostWithUser>> _fetchPostWithUsers() async {
    // 全ユーザーが投稿しているユーザーの投稿を取得
    const postWithUsers = [
      PostWithUser(
        post: Post(
          postId: '2',
          songName: 'song hoge',
          artistsName: 'artist hoge',
          songDurationMs: '3:30',
        ),
        user: User(userId: '2', name: 'name 2'),
      ),
      PostWithUser(
        post: Post(postId: '1', songName: 'hoge'),
        user: User(userId: '1', name: 'name'),
      ),
    ];
    return postWithUsers;
  }

  @override
  FutureOr<List<PostWithUser>> build() async {
    return _fetchPostWithUsers();
  }

  Future<List<PostWithUser>> fetchFollowedUserPosts(String userId) async {
    // ユーザーがフォローしているユーザーの投稿を取得
    return [];
  }
}

@riverpod
class CurrentPostWithUser extends _$CurrentPostWithUser {
  @override
  FutureOr<PostWithUser?> build() async {
    final postWithUsers = await ref.watch(homeNotifierProvider.future);
    return postWithUsers.isNotEmpty ? postWithUsers.first : null;
  }

  void selected(PostWithUser postWithUser) {
    state = AsyncData(postWithUser);
  }
}
