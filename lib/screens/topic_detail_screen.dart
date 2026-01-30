import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../models/topic.dart' as topic_models;
import '../models/user.dart';
import '../widgets/user_avatar.dart';

class TopicDetailScreen extends StatefulWidget {
  final Topic topic;

  const TopicDetailScreen({super.key, required this.topic});

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  final List<topic_models.TopicPost> _posts = [];
  final TextEditingController _postController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMockPosts();
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  void _loadMockPosts() {
    final mockUser1 = User(
      id: '1',
      username: 'TravelLover',
      email: 'travel@example.com',
      avatarUrl: null,
    );

    final mockUser2 = User(
      id: '2',
      username: 'AdventureSeeker',
      email: 'adventure@example.com',
      avatarUrl: null,
    );

    final mockUser3 = User(
      id: '3',
      username: 'GlobalNomad',
      email: 'nomad@example.com',
      avatarUrl: null,
    );

    // Generate unique comment for each topic
    String content;
    User author;
    int likesCount;
    
    switch (widget.topic.id) {
      case '1': // Budget Travel Destinations
        content = 'I recently traveled to Southeast Asia on a tight budget and managed to visit 5 countries in 3 weeks. Thailand and Vietnam are especially budget-friendly with amazing food and accommodation options.';
        author = mockUser1;
        likesCount = 45;
        break;
      case '2': // Solo Female Travel
        content = 'Great tips! I\'ve been solo traveling for 3 years now. Always share your location with friends, trust your instincts, and don\'t be afraid to say no. The world is much friendlier than the media portrays!';
        author = mockUser2;
        likesCount = 67;
        break;
      case '3': // Street Foods
        content = 'Street food is my favorite part of traveling! In Bangkok, try Pad Thai from street vendors. In Mexico City, don\'t miss the tacos al pastor. Always look for busy stalls - that\'s where the locals eat!';
        author = mockUser3;
        likesCount = 89;
        break;
      case '4': // Hidden Gems Europe
        content = 'I highly recommend Hallstatt in Austria and Český Krumlov in Czech Republic. These villages are like stepping into a fairy tale, and way less crowded than major cities!';
        author = mockUser1;
        likesCount = 52;
        break;
      case '5': // Adventure Activities
        content = 'Skydiving in Interlaken, Switzerland was the most thrilling experience of my life! The views of the Alps are absolutely breathtaking. Definitely worth adding to your bucket list.';
        author = mockUser2;
        likesCount = 73;
        break;
      case '6': // Cultural Etiquette
        content = 'In Japan, remember to bow when greeting, remove shoes indoors, and never tip at restaurants. Learning basic phrases in the local language goes a long way in showing respect!';
        author = mockUser3;
        likesCount = 61;
        break;
      case '7': // Instagram Spots
        content = 'Santorini\'s blue domes are iconic, but arrive early morning to avoid crowds! Also check out the pink salt lake in Torrevieja, Spain - absolutely stunning for photos.';
        author = mockUser1;
        likesCount = 94;
        break;
      case '8': // Packing Hacks
        content = 'Roll your clothes instead of folding - it saves space and prevents wrinkles! Also, use packing cubes to organize everything. I can fit a week\'s worth of clothes in a carry-on now.';
        author = mockUser2;
        likesCount = 78;
        break;
      case '9': // Tropical Beaches
        content = 'The Maldives is paradise on earth! Crystal clear water, overwater bungalows, and incredible marine life. El Nido in the Philippines is also stunning and more budget-friendly.';
        author = mockUser3;
        likesCount = 102;
        break;
      case '10': // Mountain Hiking
        content = 'Torres del Paine in Patagonia offers some of the most dramatic mountain scenery I\'ve ever seen. The W Trek is challenging but absolutely worth it. Make sure to book campsites in advance!';
        author = mockUser1;
        likesCount = 56;
        break;
      case '11': // Sustainable Travel
        content = 'I always carry a reusable water bottle and shopping bag. Choose eco-lodges when possible, and support local businesses instead of international chains. Small actions make a big difference!';
        author = mockUser2;
        likesCount = 64;
        break;
      case '12': // Digital Nomad
        content = 'Bali and Chiang Mai are perfect for digital nomads! Great wifi, affordable co-working spaces, and a vibrant community. Portugal is also becoming increasingly popular for remote workers.';
        author = mockUser3;
        likesCount = 88;
        break;
      default:
        content = 'Great discussion topic! Looking forward to hearing everyone\'s experiences and tips.';
        author = mockUser1;
        likesCount = 25;
    }

    setState(() {
      _posts.add(
        topic_models.TopicPost(
          id: '1',
          topicId: widget.topic.id,
          author: author,
          content: content,
          createdAt: DateTime.now().subtract(const Duration(hours: 3)),
          likesCount: likesCount,
          repliesCount: widget.topic.postsCount - 1, // Other posts are replies
        ),
      );
    });
  }


  void _submitPost() {
    if (_postController.text.trim().isEmpty) return;

    final mockUser = User(
      id: 'current_user',
      username: 'You',
      email: 'you@example.com',
    );

    final newPost = topic_models.TopicPost(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      topicId: widget.topic.id,
      author: mockUser,
      content: _postController.text.trim(),
      createdAt: DateTime.now(),
    );

    setState(() {
      _posts.insert(0, newPost);
    });

    _postController.clear();
  }

  void _showReportTopicDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Topic'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Why are you reporting this topic?'),
            const SizedBox(height: 16),
            _buildReportOption('Spam or misleading'),
            _buildReportOption('Inappropriate content'),
            _buildReportOption('Harassment or hate speech'),
            _buildReportOption('Violence or dangerous content'),
            _buildReportOption('Other'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showReportCommentDialog(String postId, String authorName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Comment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Report comment by $authorName?'),
            const SizedBox(height: 16),
            _buildReportOption('Spam or misleading'),
            _buildReportOption('Inappropriate content'),
            _buildReportOption('Harassment or hate speech'),
            _buildReportOption('Violence or dangerous content'),
            _buildReportOption('Other'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _buildReportOption(String reason) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Report submitted: $reason'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          reason,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom header with back button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Expanded(
                    child: Text(
                      'Topic Discussion',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.error_outline),
                    onPressed: () {
                      _showReportTopicDialog();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Dismiss keyboard when tapping outside
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cover image if available
                    if (widget.topic.coverImageUrl != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.topic.coverImageUrl!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image, size: 50),
                            );
                          },
                        ),
                      ),
                    if (widget.topic.coverImageUrl != null) const SizedBox(height: 16),
                    Row(
                      children: [
                        if (widget.topic.isHot)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  '🔥',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'HOT',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.topic.isHot) const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.topic.category,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.topic.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    widget.topic.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.people_outline, size: 18, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.topic.participantsCount}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.topic.postsCount}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Discussions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (_posts.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(32),
                      child: Text(
                        'No posts yet. Be the first to share!',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    )
                  else
                    ..._posts.map((post) => _buildPostCard(post)),
                ],
                ),
              ),
            ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _postController,
                      decoration: const InputDecoration(
                        hintText: 'Share your thoughts...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _submitPost,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard(topic_models.TopicPost post) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UserAvatar(
                  user: post.author,
                  radius: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.author.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        post.timeAgo,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.error_outline,
                    size: 20,
                    color: Colors.grey[600],
                  ),
                  onPressed: () => _showReportCommentDialog(post.id, post.author.username),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              post.content,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

