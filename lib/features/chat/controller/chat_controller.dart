// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/providers/message_replay_provider.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

import 'package:whatsapp_ui/features/chat/repositories/chat_repository.dart';
import 'package:whatsapp_ui/features/enums/message_emun.dart';
import 'package:whatsapp_ui/model/chat_contact.dart';
import 'package:whatsapp_ui/model/message.dart';

final ChatControllerProvider = Provider(
  (ref) {
    final ChatRepository = ref.watch(ChatRepositoryProvider);
    return ChatController(
      chatRepository: ChatRepository,
      ref: ref,
    );
  },
);

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<ChatContact>> chatContacts() {
    return chatRepository.getChatContacts();
  }

  Stream<List<Message>> chatStream(String recieverUserId) {
    return chatRepository.getChatStream(recieverUserId);
  }

  void sendTextMessage(
      BuildContext context, String text, String recieverUserId) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
      (value) {
        chatRepository.sendTextMessage(
          context: context,
          text: text,
          recieverUserId: recieverUserId,
          senderUser: value!,
          messageReply: messageReply,
        );
        ref.read(messageReplyProvider.state).update((state) => null);
      },
    );
  }

  void sendFileMessage(
    BuildContext context,
    File file,
    String recieverUserId,
    MessageEnum messageEnum,
  ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendFileMessage(
            context: context,
            file: file,
            recieverUserId: recieverUserId,
            senderUserData: value!,
            messageEnum: messageEnum,
            ref: ref,
            messageReply: messageReply,
          ),
        );
    ref.read(messageReplyProvider.state).update((state) => null); 
  }
}
