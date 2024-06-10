import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';
import '../../../common/providers/message_reply_provider.dart';
import 'display_media_file.dart';


class MessageReplyPreview extends ConsumerWidget {
  const MessageReplyPreview({super.key});

  void cancelReply(WidgetRef ref) {
    ref.read(messageReplyProvider.state).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageReply = ref.watch(messageReplyProvider);

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: MediaQuery.sizeOf(context).width/1.151,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: mobileChatBoxColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    messageReply!.isMe ? 'Me: ' : 'Opposite: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    size: 16,
                  ),
                  onTap: () => cancelReply(ref),
                ),
              ],
            ),
            const SizedBox(height: 5),
            DisplayTextImageGIF(
              message: messageReply.message,
              type: messageReply.messageEnum,
            ),
          ],
        ),
      ),
    );
  }
}