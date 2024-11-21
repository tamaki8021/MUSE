// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

/// Firestoreの`Messages`サブコレクションを表すモデル。
@freezed
class Message with _$Message {
  const factory Message({
    /// Firestore上のメッセージID（ドキュメントID）
    required String messageId,

    /// メッセージ送信者のUID
    required String senderId,

    /// メッセージ本文
    @Default('') String text,

    /// 添付された画像のURL（オプション）
    @Default('') String imageUrl,

    /// 添付された音声メッセージのURL（オプション）
    @Default('') String audioUrl,

    /// メッセージを既読したユーザーのUIDリスト
    @Default([]) List<String> readBy,

    /// メッセージの送信日時
    DateTime? createdAt,
  }) = _Message;

  /// JSONデータからDartオブジェクトを生成するためのファクトリ
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
