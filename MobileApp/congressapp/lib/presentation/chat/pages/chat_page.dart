import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: AppStrings.chatroom),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageTile(messages[index]);
                },
              ),
            ),
            _buildBottomChatArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomChatArea() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Message message) {
    return CustomChatBubble(
      message: message.text,
      isMe: message.isMe,
      timestamp: message.timestamp,
      avatarImageUrl: message.senderImage,
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        Message newMessage = Message(
          text: messageText,
          senderImage: 'assets/images/logo.png',
          timestamp: _getCurrentTimestamp(),
          isMe: true,
        );
        messages.add(newMessage);
        _messageController.clear();
      });
    }
  }

  String _getCurrentTimestamp() {
    DateTime now = DateTime.now();
    String formattedTime = '${now.hour}:${now.minute}';
    return formattedTime;
  }
}

class Message {
  final String text;
  final String senderImage;
  final String timestamp;
  final bool isMe;

  Message({
    required this.text,
    required this.senderImage,
    required this.timestamp,
    this.isMe = false,
  });
}

class CustomChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String timestamp;
  final String avatarImageUrl;

  const CustomChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.timestamp,
    required this.avatarImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 310,
              child: ChatBubble(
                backGroundColor: const Color.fromARGB(185, 56, 134, 59),
                clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          message,
                          style: const TextStyle(
                              color: Colors.white, overflow: TextOverflow.fade),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        timestamp,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            _buildAvatar(),
          ]),
    );
  }

  Widget _buildAvatar() {
    return const CircleAvatar(
      radius: 15,
      backgroundImage: AssetImage('assets/images/logo.png'),
    );
  }
}
