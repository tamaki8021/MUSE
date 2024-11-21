// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

/// Firestoreの`posts`サブコレクションを表すモデル。
@freezed
class Post with _$Post {
  const factory Post({
    /// Firestore上の投稿ID（ドキュメントID）
    required String postId,

    /// 曲名
    @Default('') String songName,

    /// アーティスト名
    @Default('') String artistsName,

    /// アルバムのジャケット画像URL
    @Default('') String albumImageUrl,

    /// 曲の長さ（ミリ秒単位）
    @Default('') String songDurationMs,

    /// 曲のプレビュー音源のURL
    @Default('') String previewUrl,

    /// 外部サービスでの曲のURL（SpotifyやApple Musicなど）
    @Default('') String externalUrl,

    /// 投稿日時
    DateTime? createdAt,
  }) = _Post;

  /// JSONデータからDartオブジェクトを生成するためのファクトリ
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
