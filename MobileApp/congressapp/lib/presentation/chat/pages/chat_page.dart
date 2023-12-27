import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: Column(
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
    );
  }

  Widget _buildBottomChatArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          senderImage: 'https://example.com/user_avatar.jpg',
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
      child: ChatBubble(
        clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                _buildAvatar(),
              ],
            ),
            Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 4.0),
            Text(
              timestamp,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      backgroundImage: NetworkImage(avatarImageUrl),
    );
  }
}
