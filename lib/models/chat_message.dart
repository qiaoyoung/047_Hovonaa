class ChatMessage {
  final String id;
  final String videoId;
  final String? text;
  final String? imagePath;
  final bool isMe;
  final DateTime createdAt;

  ChatMessage({
    required this.id,
    required this.videoId,
    this.text,
    this.imagePath,
    required this.isMe,
    required this.createdAt,
  });

  bool get hasText => text != null && text!.isNotEmpty;

  bool get hasImage => imagePath != null && imagePath!.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'videoId': videoId,
      'text': text,
      'imagePath': imagePath,
      'isMe': isMe,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] as String,
      videoId: json['videoId'] as String,
      text: json['text'] as String?,
      imagePath: json['imagePath'] as String?,
      isMe: json['isMe'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}


