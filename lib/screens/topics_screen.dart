import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../models/user.dart';
import 'topic_detail_screen.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  final List<Topic> _topics = [];
  final List<String> _categories = ['All', 'Destinations', 'Tips', 'Food', 'Adventure', 'Culture'];

  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _loadMockTopics();
  }

  void _loadMockTopics() {
    final mockUser1 = User(
      id: '1',
      username: 'TravelExpert',
      email: 'expert@example.com',
      avatarUrl: null,
    );

    final mockUser2 = User(
      id: '2',
      username: 'Wanderlust',
      email: 'wander@example.com',
      avatarUrl: null,
    );

    final mockUser3 = User(
      id: '3',
      username: 'FoodieTraveler',
      email: 'foodie@example.com',
      avatarUrl: null,
    );

    final mockUser4 = User(
      id: '4',
      username: 'AdventureSeeker',
      email: 'adventure@example.com',
      avatarUrl: null,
    );

    final mockUser5 = User(
      id: '5',
      username: 'BeachLover',
      email: 'beach@example.com',
      avatarUrl: null,
    );

    setState(() {
      _topics.addAll([
        Topic(
          id: '1',
          title: 'Best Budget Travel Destinations in Southeast Asia',
          description: 'Share your favorite budget-friendly travel destinations and money-saving tips for exploring Southeast Asia.',
          category: 'Destinations',
          createdBy: mockUser1,
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          participantsCount: 12,
          postsCount: 3,
          lastActivityAt: DateTime.now().subtract(const Duration(minutes: 30)),
          isHot: true,
          coverImageUrl: 'https://images.unsplash.com/photo-1528181304800-259b08848526?w=800&q=80', // Thailand temple
        ),
        Topic(
          id: '2',
          title: 'Solo Female Travel Safety & Empowerment',
          description: 'Share safety tips, empowering stories, and advice for women traveling solo around the world.',
          category: 'Tips',
          createdBy: mockUser2,
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
          participantsCount: 8,
          postsCount: 1,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 2)),
          isHot: true,
          coverImageUrl: 'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=800&q=80', // Woman with backpack
        ),
        Topic(
          id: '3',
          title: 'Must-Try Street Foods Around the World',
          description: 'Share your favorite street food experiences, from Thai Pad Thai to Mexican Tacos.',
          category: 'Food',
          createdBy: mockUser3,
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          participantsCount: 2,
          postsCount: 5,
          lastActivityAt: DateTime.now().subtract(const Duration(minutes: 15)),
          isHot: true,
          coverImageUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&q=80', // Street food
        ),
        Topic(
          id: '4',
          title: 'Hidden Gems in European Villages',
          description: 'Discover charming villages and lesser-known beautiful places in Europe worth visiting.',
          category: 'Destinations',
          createdBy: mockUser1,
          createdAt: DateTime.now().subtract(const Duration(days: 7)),
          participantsCount: 6,
          postsCount: 1,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 5)),
          isHot: false,
          coverImageUrl: 'https://images.unsplash.com/photo-1509840841025-9088ba78a826?w=800&q=80', // European village
        ),
        Topic(
          id: '5',
          title: 'Extreme Adventure Activities & Sports',
          description: 'Discuss skydiving, bungee jumping, scuba diving and other extreme activities during travels.',
          category: 'Adventure',
          createdBy: mockUser4,
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
          participantsCount: 7,
          postsCount: 2,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 1)),
          isHot: false,
          coverImageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&q=80', // Mountain climbing
        ),
        Topic(
          id: '6',
          title: 'Cultural Etiquette & Local Customs',
          description: 'Learn about important cultural customs, taboos, and etiquette before visiting different countries.',
          category: 'Culture',
          createdBy: mockUser3,
          createdAt: DateTime.now().subtract(const Duration(days: 4)),
          participantsCount: 9,
          postsCount: 2,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 3)),
          isHot: false,
          coverImageUrl: 'https://images.unsplash.com/photo-1548013146-72479768bada?w=800&q=80', // Japanese culture
        ),
        Topic(
          id: '7',
          title: 'Most Instagrammable Travel Spots 2026',
          description: 'Share the most photogenic and Instagram-worthy locations you\'ve discovered.',
          category: 'Tips',
          createdBy: mockUser2,
          createdAt: DateTime.now().subtract(const Duration(days: 6)),
          participantsCount: 14,
          postsCount: 4,
          lastActivityAt: DateTime.now().subtract(const Duration(minutes: 45)),
          isHot: true,
          coverImageUrl: 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?w=800&q=80', // Travel photo spot
        ),
        Topic(
          id: '8',
          title: 'Minimalist Travel & Packing Light',
          description: 'Share tips for traveling with only a carry-on and living the minimalist travel lifestyle.',
          category: 'Tips',
          createdBy: mockUser1,
          createdAt: DateTime.now().subtract(const Duration(days: 8)),
          participantsCount: 11,
          postsCount: 2,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 4)),
          isHot: false,
          coverImageUrl: 'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=800&q=80', // Minimal luggage
        ),
        Topic(
          id: '9',
          title: 'Tropical Beach Paradise Destinations',
          description: 'Discuss the most beautiful tropical beaches, from Maldives to Caribbean islands.',
          category: 'Destinations',
          createdBy: mockUser5,
          createdAt: DateTime.now().subtract(const Duration(days: 9)),
          participantsCount: 18,
          postsCount: 4,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 6)),
          isHot: true,
          coverImageUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800&q=80', // Tropical beach
        ),
        Topic(
          id: '10',
          title: 'Mountain Hiking & Trekking Adventures',
          description: 'Share your favorite mountain trails, hiking tips, and breathtaking summit experiences.',
          category: 'Adventure',
          createdBy: mockUser4,
          createdAt: DateTime.now().subtract(const Duration(days: 10)),
          participantsCount: 9,
          postsCount: 2,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 7)),
          isHot: false,
          coverImageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&q=80', // Mountain landscape
        ),
        Topic(
          id: '11',
          title: 'Sustainable & Eco-Friendly Travel',
          description: 'Discuss ways to travel responsibly and reduce your environmental footprint while exploring.',
          category: 'Culture',
          createdBy: mockUser3,
          createdAt: DateTime.now().subtract(const Duration(days: 11)),
          participantsCount: 7,
          postsCount: 1,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 8)),
          isHot: false,
          coverImageUrl: 'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=800&q=80', // Eco travel
        ),
        Topic(
          id: '12',
          title: 'Working Remotely While Traveling',
          description: 'Share experiences, tips, and best destinations for digital nomads and remote workers.',
          category: 'Tips',
          createdBy: mockUser2,
          createdAt: DateTime.now().subtract(const Duration(days: 12)),
          participantsCount: 16,
          postsCount: 3,
          lastActivityAt: DateTime.now().subtract(const Duration(hours: 9)),
          isHot: true,
          coverImageUrl: 'https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=800&q=80', // Laptop on beach
        ),
      ]);
    });
  }

  List<Topic> get _filteredTopics {
    if (_selectedCategory == 'All') {
      return _topics;
    }
    return _topics.where((topic) => topic.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTopics = _filteredTopics;
    final hotTopics = filteredTopics.where((topic) => topic.isHot).toList();
    final otherTopics = filteredTopics.where((topic) => !topic.isHot).toList();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF5E80FE).withOpacity(0.05),
              const Color(0xFF8FA4FF).withOpacity(0.08),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
        child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    selectedColor: Theme.of(context).colorScheme.primaryContainer,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: filteredTopics.isEmpty
                ? const Center(
                    child: Text('No topics found'),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        if (hotTopics.isNotEmpty) ...[
                          const Text(
                            '🔥 Hot Topics',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...hotTopics.map((topic) => _buildTopicCard(topic, context)),
                          const SizedBox(height: 24),
                        ],
                        if (otherTopics.isNotEmpty) ...[
                          const Text(
                            'All Topics',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...otherTopics.map((topic) => _buildTopicCard(topic, context)),
                        ],
                      ],
                    ),
                  ),
          ),
        ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopicCard(Topic topic, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TopicDetailScreen(topic: topic),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            if (topic.coverImageUrl != null)
              Stack(
                children: [
                  Image.network(
                    topic.coverImageUrl!,
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
                  // Gradient overlay for text readability
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Badges on image
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Row(
                      children: [
                        if (topic.isHot)
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
                        if (topic.isHot) const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            topic.category,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    topic.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.people_outline, size: 18, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    '${topic.participantsCount}',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    '${topic.postsCount}',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

