// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

/// Firestoreの`Chats`コレクションを表すモデル。
@freezed
class Chat with _$Chat {
  const factory Chat({
    /// Firestore上のチャットID（ドキュメントID）
    required String chatId,

    /// チャットに参加しているユーザーのUIDリスト
    required List<String> members,

    /// グループチャットかどうかを表すフラグ
    @Default(false) bool isGroup,

    /// チャットの作成日時
    DateTime? createdAt,

    /// 最後にメッセージが送信された日時
    DateTime? updatedAt,
  }) = _Chat;

  /// JSONデータからDartオブジェクトを生成するためのファクトリ
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
