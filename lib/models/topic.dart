import 'user.dart';

class Topic {
  final String id;
  final String title;
  final String description;
  final String category;
  final User createdBy;
  final DateTime createdAt;
  final int participantsCount;
  final int postsCount;
  final DateTime lastActivityAt;
  final bool isHot;
  final String? coverImageUrl; // Added for visual display

  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.createdBy,
    required this.createdAt,
    this.participantsCount = 0,
    this.postsCount = 0,
    required this.lastActivityAt,
    this.isHot = false,
    this.coverImageUrl, // Added parameter
  });

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(lastActivityAt);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}y ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}mo ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

class TopicPost {
  final String id;
  final String topicId;
  final User author;
  final String content;
  final List<String> imageUrls;
  final DateTime createdAt;
  final int likesCount;
  final int repliesCount;
  final List<String> likedBy;

  TopicPost({
    required this.id,
    required this.topicId,
    required this.author,
    required this.content,
    this.imageUrls = const [],
    required this.createdAt,
    this.likesCount = 0,
    this.repliesCount = 0,
    this.likedBy = const [],
  });

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()}y ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()}mo ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

