// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/enums/message_emun.dart';

class MessageReply {
  final String message;
  final bool isMe;
  final MessageEnum messageEnum;

  MessageReply({
    required this.message,
    required this.isMe,
    required this.messageEnum,
  });
}

final messageReplyProvider = StateProvider<MessageReply?>((ref) => null);
