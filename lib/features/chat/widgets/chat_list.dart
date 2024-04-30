import 'package:chit_chat/common/widgets/loader.dart';
import 'package:chit_chat/features/chat/controllers/chat_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chit_chat/info.dart';
import 'package:chit_chat/widgets/my_message_card.dart';
import 'package:chit_chat/widgets/sender_message_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/message.dart';




class ChatList extends ConsumerWidget {
  final String receiverUserId;

  const ChatList({
    super.key,
    required this.receiverUserId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<Message>>(
        stream: ref.read(chatControllerProvider).chatStream(receiverUserId),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final messageData = snapshot.data![index];

              if (messageData.senderId == FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  message: messageData.text,
                  date: DateFormat.Hm().format(messageData.timeSent),
                );
              }
              return SenderMessageCard(
                message: messageData.text,
                date: DateFormat.Hm().format(messageData.timeSent),
              );
            },
          );
        });
  }
}
