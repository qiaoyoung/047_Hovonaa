import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import '../models/chat_message.dart';
import '../models/travel_video.dart';
import '../services/chat_storage.dart';
import '../services/image_storage.dart';
import '../services/block_storage.dart';
import '../widgets/user_avatar.dart';

class ChatScreen extends StatefulWidget {
  final TravelVideo video;

  const ChatScreen({
    super.key,
    required this.video,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  bool _isBlocked = false;

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _checkBlockStatus();
  }

  Future<void> _checkBlockStatus() async {
    final blocked = await BlockStorage.isUserBlocked(widget.video.author.id);
    if (mounted) {
      setState(() {
        _isBlocked = blocked;
      });
    }
  }


  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMessages() async {
    final loaded = await ChatStorage.loadMessages(widget.video.id);
    if (!mounted) return;
    setState(() {
      _messages
        ..clear()
        ..addAll(loaded);
      _isLoading = false;
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _sendTextMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      videoId: widget.video.id,
      text: text,
      imagePath: null,
      isMe: true,
      createdAt: DateTime.now(),
    );

    setState(() {
      _messages.add(message);
      _textController.clear();
    });
    await ChatStorage.addMessage(widget.video.id, message);
    _scrollToBottom();
  }

  Future<void> _sendImageMessage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (pickedFile == null) return;

    try {
      final imageFile = File(pickedFile.path);
      final savedPath = await ImageStorage.saveImage(imageFile);
      final fileName = path.basename(savedPath);

      final message = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        videoId: widget.video.id,
        text: null,
        imagePath: fileName,
        isMe: true,
        createdAt: DateTime.now(),
      );

      setState(() {
        _messages.add(message);
      });
      await ChatStorage.addMessage(widget.video.id, message);
      _scrollToBottom();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send image: $e')),
      );
    }
  }

  Future<void> _blockUser() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Block User'),
        content: Text('Are you sure you want to block ${widget.video.author.username}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Block', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await BlockStorage.blockUser(widget.video.author.id);
      if (mounted) {
        setState(() {
          _isBlocked = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User has been blocked')),
        );
      }
    }
  }

  Future<void> _unblockUser() async {
    await BlockStorage.unblockUser(widget.video.author.id);
    if (mounted) {
      setState(() {
        _isBlocked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User has been unblocked')),
      );
    }
  }

  Future<void> _reportUser() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report User'),
        content: Text('Are you sure you want to report ${widget.video.author.username}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Report', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await BlockStorage.reportUser(widget.video.author.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User has been reported. Thank you for your feedback.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.video.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (!_isBlocked)
              Text(
                widget.video.author.username,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              )
            else
              const Text(
                'Blocked User',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'block':
                  _blockUser();
                  break;
                case 'unblock':
                  _unblockUser();
                  break;
                case 'report':
                  _reportUser();
                  break;
              }
            },
            itemBuilder: (context) => [
              if (_isBlocked)
                const PopupMenuItem(
                  value: 'unblock',
                  child: Row(
                    children: [
                      Icon(Icons.person_add, size: 20),
                      SizedBox(width: 8),
                      Text('Unblock User'),
                    ],
                  ),
                )
              else
                PopupMenuItem(
                  value: 'block',
                  child: const Row(
                    children: [
                      Icon(Icons.block, size: 20, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Block User', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              if (!_isBlocked)
                const PopupMenuItem(
                  value: 'report',
                  child: Row(
                    children: [
                      Icon(Icons.flag, size: 20, color: Colors.orange),
                      SizedBox(width: 8),
                      Text('Report User', style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _isBlocked
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.block,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'This user has been blocked.',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'All messages are hidden.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : _messages.isEmpty
                        ? const Center(
                            child: Text(
                              'No messages yet.\nStart the conversation!',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            itemCount: _messages.length,
                            itemBuilder: (context, index) {
                              final message = _messages[index];
                              final isMe = message.isMe;
                          return Align(
                            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                                children: [
                                  if (!isMe)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: UserAvatar(
                                        user: widget.video.author,
                                        radius: 14,
                                      ),
                                    ),
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: isMe
                                            ? Theme.of(context).colorScheme.primary
                                            : Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (message.hasImage)
                                            FutureBuilder<String>(
                                              future: ImageStorage.isLocalPath(message.imagePath!)
                                                  ? ImageStorage.getImagePath(message.imagePath!)
                                                  : Future.value(message.imagePath!),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const SizedBox(
                                                    width: 180,
                                                    height: 180,
                                                    child: Center(child: CircularProgressIndicator()),
                                                  );
                                                }
                                                final imagePath = snapshot.data!;
                                                return ClipRRect(
                                                  borderRadius: BorderRadius.circular(8),
                                                  child: ImageStorage.isLocalPath(message.imagePath!)
                                                      ? Image.file(
                                                          File(imagePath),
                                                          width: 180,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context, error, stackTrace) {
                                                            return Container(
                                                              width: 180,
                                                              height: 180,
                                                              color: Colors.grey[300],
                                                              child: const Icon(Icons.broken_image),
                                                            );
                                                          },
                                                        )
                                                      : Image.asset(
                                                          imagePath,
                                                          width: 180,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context, error, stackTrace) {
                                                            return Container(
                                                              width: 180,
                                                              height: 180,
                                                              color: Colors.grey[300],
                                                              child: const Icon(Icons.broken_image),
                                                            );
                                                          },
                                                        ),
                                                );
                                              },
                                            ),
                                          if (message.hasImage && message.hasText)
                                            const SizedBox(height: 6),
                                          if (message.hasText)
                                            Text(
                                              message.text!,
                                              style: TextStyle(
                                                color: isMe ? Colors.white : Colors.black87,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (isMe)
                                    const SizedBox(width: 32),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
          if (!_isBlocked)
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.image_outlined),
                        onPressed: _sendImageMessage,
                        color: Theme.of(context).colorScheme.primary,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        minLines: 1,
                        maxLines: 4,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _sendTextMessage,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}


