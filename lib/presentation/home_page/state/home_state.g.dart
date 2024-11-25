// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostWithUserImpl _$$PostWithUserImplFromJson(Map<String, dynamic> json) =>
    _$PostWithUserImpl(
      post: Post.fromJson(json['post'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostWithUserImplToJson(_$PostWithUserImpl instance) =>
    <String, dynamic>{
      'post': instance.post,
      'user': instance.user,
    };

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      postWithUsers: (json['postWithUsers'] as List<dynamic>)
          .map((e) => PostWithUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'postWithUsers': instance.postWithUsers,
    };
