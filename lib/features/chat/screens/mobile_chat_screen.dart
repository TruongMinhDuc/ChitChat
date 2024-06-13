import 'package:chit_chat/common/widgets/loader.dart';
import 'package:chit_chat/features/auth/controller/auth_controller.dart';
import 'package:chit_chat/features/call/screens/call_pickup_screen.dart';
import 'package:chit_chat/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:chit_chat/features/chat/widgets/chat_list.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/colors.dart';
import '../../call/controller/call_controller.dart';
import '../widgets/bottom_chat_field.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  final bool isGroupChat;
  final String profilePic;

  const MobileChatScreen({
    super.key,
    required this.name,
    required this.uid,
    required this.isGroupChat,
    required this.profilePic,
  });

  void makeCall(WidgetRef ref, BuildContext context) {
    ref.read(callControllerProvider).makeCall(
          context,
          name,
          uid,
          profilePic,
          isGroupChat,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var number = "";
    return CallPickupScreen(
      scaffold: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: isGroupChat
              ? Text(name)
              : StreamBuilder<UserModel>(
                  stream: ref.read(authControllerProvider).userDataById(uid),
                  builder: (context, snapshot) {
                    number = snapshot.data!.phoneNumber;
                    bool _isOnline = false;
                    if (snapshot.hasData) {
                      _isOnline = snapshot.data!.isOnline;
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loader();
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        Text(
                          _isOnline ? '🟢 online' : '⚪ offline',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  }),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () => makeCall(ref, context),
              icon: const Icon(Icons.video_call),
            ),
            IconButton(
              onPressed: () {
                FlutterPhoneDirectCaller.callNumber(number);
              },
              icon: const Icon(Icons.call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/backgroundImage.png"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Expanded(
                child: ChatList(
                  receiverUserId: uid,
                  isGroupChat: isGroupChat,
                ),
              ),
              BottomChatField(
                receiverUserId: uid,
                isGroupChat: isGroupChat,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
