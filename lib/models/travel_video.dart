import 'user.dart';

class TravelVideo {
  final String id;
  final User author;
  final String title;
  final String description;
  final String videoUrl;
  final String thumbnailUrl;
  final String location;
  final DateTime createdAt;
  final int viewsCount;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final List<String> tags;
  final bool isRecommended;

  TravelVideo({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.location,
    required this.createdAt,
    this.viewsCount = 0,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    this.tags = const [],
    this.isRecommended = false,
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

  String get formattedViews {
    if (viewsCount >= 1000000) {
      return '${(viewsCount / 1000000).toStringAsFixed(1)}M';
    } else if (viewsCount >= 1000) {
      return '${(viewsCount / 1000).toStringAsFixed(1)}K';
    }
    return viewsCount.toString();
  }
}

