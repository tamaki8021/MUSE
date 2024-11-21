// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  /// Firestore上の投稿ID（ドキュメントID）
  String get postId => throw _privateConstructorUsedError;

  /// 曲名
  String get songName => throw _privateConstructorUsedError;

  /// アーティスト名
  String get artistsName => throw _privateConstructorUsedError;

  /// アルバムのジャケット画像URL
  String get albumImageUrl => throw _privateConstructorUsedError;

  /// 曲の長さ（ミリ秒単位）
  String get songDurationMs => throw _privateConstructorUsedError;

  /// 曲のプレビュー音源のURL
  String get previewUrl => throw _privateConstructorUsedError;

  /// 外部サービスでの曲のURL（SpotifyやApple Musicなど）
  String get externalUrl => throw _privateConstructorUsedError;

  /// 投稿日時
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String postId,
      String songName,
      String artistsName,
      String albumImageUrl,
      String songDurationMs,
      String previewUrl,
      String externalUrl,
      DateTime? createdAt});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? songName = null,
    Object? artistsName = null,
    Object? albumImageUrl = null,
    Object? songDurationMs = null,
    Object? previewUrl = null,
    Object? externalUrl = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artistsName: null == artistsName
          ? _value.artistsName
          : artistsName // ignore: cast_nullable_to_non_nullable
              as String,
      albumImageUrl: null == albumImageUrl
          ? _value.albumImageUrl
          : albumImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      songDurationMs: null == songDurationMs
          ? _value.songDurationMs
          : songDurationMs // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: null == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String,
      externalUrl: null == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postId,
      String songName,
      String artistsName,
      String albumImageUrl,
      String songDurationMs,
      String previewUrl,
      String externalUrl,
      DateTime? createdAt});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? songName = null,
    Object? artistsName = null,
    Object? albumImageUrl = null,
    Object? songDurationMs = null,
    Object? previewUrl = null,
    Object? externalUrl = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$PostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      artistsName: null == artistsName
          ? _value.artistsName
          : artistsName // ignore: cast_nullable_to_non_nullable
              as String,
      albumImageUrl: null == albumImageUrl
          ? _value.albumImageUrl
          : albumImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      songDurationMs: null == songDurationMs
          ? _value.songDurationMs
          : songDurationMs // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: null == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String,
      externalUrl: null == externalUrl
          ? _value.externalUrl
          : externalUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.postId,
      this.songName = '',
      this.artistsName = '',
      this.albumImageUrl = '',
      this.songDurationMs = '',
      this.previewUrl = '',
      this.externalUrl = '',
      this.createdAt});

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  /// Firestore上の投稿ID（ドキュメントID）
  @override
  final String postId;

  /// 曲名
  @override
  @JsonKey()
  final String songName;

  /// アーティスト名
  @override
  @JsonKey()
  final String artistsName;

  /// アルバムのジャケット画像URL
  @override
  @JsonKey()
  final String albumImageUrl;

  /// 曲の長さ（ミリ秒単位）
  @override
  @JsonKey()
  final String songDurationMs;

  /// 曲のプレビュー音源のURL
  @override
  @JsonKey()
  final String previewUrl;

  /// 外部サービスでの曲のURL（SpotifyやApple Musicなど）
  @override
  @JsonKey()
  final String externalUrl;

  /// 投稿日時
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Post(postId: $postId, songName: $songName, artistsName: $artistsName, albumImageUrl: $albumImageUrl, songDurationMs: $songDurationMs, previewUrl: $previewUrl, externalUrl: $externalUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.songName, songName) ||
                other.songName == songName) &&
            (identical(other.artistsName, artistsName) ||
                other.artistsName == artistsName) &&
            (identical(other.albumImageUrl, albumImageUrl) ||
                other.albumImageUrl == albumImageUrl) &&
            (identical(other.songDurationMs, songDurationMs) ||
                other.songDurationMs == songDurationMs) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.externalUrl, externalUrl) ||
                other.externalUrl == externalUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postId, songName, artistsName,
      albumImageUrl, songDurationMs, previewUrl, externalUrl, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String postId,
      final String songName,
      final String artistsName,
      final String albumImageUrl,
      final String songDurationMs,
      final String previewUrl,
      final String externalUrl,
      final DateTime? createdAt}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override

  /// Firestore上の投稿ID（ドキュメントID）
  String get postId;
  @override

  /// 曲名
  String get songName;
  @override

  /// アーティスト名
  String get artistsName;
  @override

  /// アルバムのジャケット画像URL
  String get albumImageUrl;
  @override

  /// 曲の長さ（ミリ秒単位）
  String get songDurationMs;
  @override

  /// 曲のプレビュー音源のURL
  String get previewUrl;
  @override

  /// 外部サービスでの曲のURL（SpotifyやApple Musicなど）
  String get externalUrl;
  @override

  /// 投稿日時
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
