// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postId: json['postId'] as String,
      songName: json['songName'] as String? ?? '',
      artistsName: json['artistsName'] as String? ?? '',
      albumImageUrl: json['albumImageUrl'] as String? ?? '',
      songDurationMs: json['songDurationMs'] as String? ?? '',
      previewUrl: json['previewUrl'] as String? ?? '',
      externalUrl: json['externalUrl'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'songName': instance.songName,
      'artistsName': instance.artistsName,
      'albumImageUrl': instance.albumImageUrl,
      'songDurationMs': instance.songDurationMs,
      'previewUrl': instance.previewUrl,
      'externalUrl': instance.externalUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
