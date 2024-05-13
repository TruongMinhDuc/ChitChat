import 'dart:io';

import 'package:chit_chat/common/enums/message_enum.dart';
import 'package:chit_chat/features/auth/controller/auth_controller.dart';
import 'package:chit_chat/features/chat/repositories/chat_repository.dart';
import 'package:chit_chat/models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

import '../../../common/providers/message_reply_provider.dart';
import '../../../models/chat_contact.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

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

  Stream<List<Message>> chatStream(String receiverUserId) {
    return chatRepository.getChatStream(receiverUserId);
  }

  void sendTextMessage(BuildContext context,
      String text,
      String receiverUserId,
      ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (value) =>
          chatRepository.sendTextMessage(
            context: context,
            text: text,
            receiverUserId: receiverUserId,
            senderUser: value!,
            messageReply: messageReply
          ),
    );
  }

  void sendFileMessage(BuildContext context,
      File file,
      String receiverUserId,
      MessageEnum messageEnum,
      ) {
    final messageReply = ref.read(messageReplyProvider);
    ref.read(userDataAuthProvider).whenData(
          (value) =>
          chatRepository.sendFileMessage(
            context: context,
            file: file,
            receiverUserId: receiverUserId,
            senderUserData: value!,
            ref: ref,
            messageEnum: messageEnum,
            messageReply: messageReply,
          ),
    );
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  void sendGIFMessage(BuildContext context,
      String gifUrl,
      String receiverUserId,
      ) {
    final messageReply = ref.read(messageReplyProvider);
    int gifUrlPartIndex = gifUrl.lastIndexOf('-') + 1;
    String gifUrlPart = gifUrl.substring(gifUrlPartIndex);
    String newgifUrl = 'https://i.giphy.com/media/$gifUrlPart/200.gif';

    ref.read(userDataAuthProvider).whenData(
          (value) =>
          chatRepository.sendGIFMessage(
              context: context,
              gifUrl: newgifUrl,
              receiverUserId: receiverUserId,
              senderUser: value!,
              messageReply: messageReply ,
          ),
    );
    ref.read(messageReplyProvider.state).update((state) => null);
  }
  void setChatMessageSeen(
      BuildContext context,
      String receiverUserId,
      String messageId,
      ) {
    chatRepository.setChatMessageSeen(
      context,
      receiverUserId,
      messageId,
    );
  }
}
