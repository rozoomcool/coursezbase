import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/app_router.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(),
            title: Text("List title: $index"),
            subtitle: const Text("subtitle"),
            trailing: const Badge(),
            onTap: () {
              // context.pushRoute();
              AutoRouter.of(context).push(ChatRoomRoute(username: index.toString()));
            },
          );
        });
  }
}
