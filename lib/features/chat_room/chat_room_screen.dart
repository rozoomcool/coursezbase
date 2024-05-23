import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

import '../../utils/api_constants.dart';

@RoutePage()
class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key, required this.username});

  final String username;

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  late StompClient client;
  List<String> texts = List.empty(growable: true);
  late Map<String, String> head;

  @override
  void initState() {
    super.initState();
    head = {
      "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVVNFUiIsImlkIjo1LCJlbWFpbCI6InJvem9vbWNvb2wxQG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlt7ImF1dGhvcml0eSI6IlVTRVIifV0sInN1YiI6InJvem9vbWNvb2wxIiwiaWF0IjoxNzE0OTExNDM1LCJleHAiOjE3MTYzNTE0MzV9.oah7jJsWhyz-TGKAYD50RjCvrAdIB4uU2kloVZny2IE"
    };
    client = StompClient(
        config: StompConfig(
            stompConnectHeaders: head,
            webSocketConnectHeaders: head,
            url: 'ws://$baseUrl/ws',
            onConnect: (frame) {
              print(frame.toString());
              print("CONNECTED");
            },
            onStompError: (frame) {
              print("ERROR CONNECTED: ${frame.headers}");
            }));
    client.activate();
    Future.delayed(Duration(seconds: 2), () {
      client.subscribe(
          headers: head,
          destination: "/user/queue/private",
          callback: (frame) {
            print('Received: ' + frame.body!! ?? "");
            setState(() => texts.add(frame.body ?? ""));
          });
      client.subscribe(
          headers: head,
          destination: "/topic/private-user",
          callback: (frame) {
            print('Received: ' + frame.body!! ?? "");
            setState(() => texts.add(frame.body ?? ""));
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    client.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: CircleAvatar(),
            ),
            const SizedBox(width: 8),
            Text("Username: ${widget.username}"),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...texts.reversed.map((element) => Text(element)),
                const Text("Hello"),
                Container(
                  height: 28,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.0),
                        topRight: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                    ),
                    color: Colors.red,
                  ),
                  child: const Text("message"),
                ),
                const SizedBox(
                  height: 64,
                )
              ],
            ),
          ),
          Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: 42,
                    child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                            prefixIcon: const Icon(Iconsax.sticker),
                            suffixIcon: const Icon(Iconsax.paperclip),
                            labelText: "Message",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)))),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 1,
                  child: IconButton.filledTonal(
                      onPressed: () {
                        client.send(
                          headers: head,
                            destination: "/app/private",
                            body: json.encode({
                              "senderName": "rozoomcool1",
                              "recipientName": "rozoomcool",
                              "content": "programming"
                            }));
                      },
                      icon: const Icon(Iconsax.airplane)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
