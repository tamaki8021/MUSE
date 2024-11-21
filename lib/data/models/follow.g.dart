// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowImpl _$$FollowImplFromJson(Map<String, dynamic> json) => _$FollowImpl(
      userId: json['userId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FollowImplToJson(_$FollowImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
