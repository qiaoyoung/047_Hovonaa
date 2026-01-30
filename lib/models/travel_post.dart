import 'user.dart';

class TravelPost {
  final String id;
  final User author;
  final String title;
  final String content;
  final List<String> imageUrls;
  final String? videoUrl;
  final String? category;
  final String location;
  final DateTime createdAt;
  final int likesCount;
  final int commentsCount;
  final List<String> likedBy;
  final List<String> tags;

  TravelPost({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
    this.imageUrls = const [],
    this.videoUrl,
    this.category,
    required this.location,
    required this.createdAt,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.likedBy = const [],
    this.tags = const [],
  });

  bool get hasVideo => videoUrl != null && videoUrl!.isNotEmpty;

  TravelPost copyWith({
    String? id,
    User? author,
    String? title,
    String? content,
    List<String>? imageUrls,
    String? videoUrl,
    String? category,
    String? location,
    DateTime? createdAt,
    int? likesCount,
    int? commentsCount,
    List<String>? likedBy,
    List<String>? tags,
  }) {
    return TravelPost(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrls: imageUrls ?? this.imageUrls,
      videoUrl: videoUrl ?? this.videoUrl,
      category: category ?? this.category,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      likedBy: likedBy ?? this.likedBy,
      tags: tags ?? this.tags,
    );
  }

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

