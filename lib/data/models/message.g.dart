// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      messageId: json['messageId'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      audioUrl: json['audioUrl'] as String? ?? '',
      readBy: (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'audioUrl': instance.audioUrl,
      'readBy': instance.readBy,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
