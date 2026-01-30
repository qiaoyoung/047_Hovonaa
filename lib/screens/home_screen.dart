import 'package:flutter/material.dart';
import '../models/travel_post.dart';
import '../models/user.dart';
import '../widgets/post_card.dart';
import 'post_detail_screen.dart';
import 'create_post_screen.dart';
import 'fullscreen_video_player_screen.dart';
import '../services/hidden_post_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TravelPost> _posts = [];
  final Set<String> _likedPosts = {};
  Set<String> _hiddenPostIds = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    
    _hiddenPostIds = await HiddenPostStorage.getHiddenPostIds();
    _loadMockPosts();
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<TravelPost> get _visiblePosts {
    return _posts.where((post) => !_hiddenPostIds.contains(post.id)).toList();
  }

  void _loadMockPosts() {
    final mockUser1 = User(
      id: '1',
      username: 'TravelLover',
      email: 'travel@example.com',
      avatarUrl: null,
      bio: 'Exploring the world one destination at a time',
    );

    final mockUser2 = User(
      id: '2',
      username: 'Wanderlust',
      email: 'wander@example.com',
      avatarUrl: null,
      bio: 'Adventure seeker',
    );

    final mockUser3 = User(
      id: '3',
      username: 'GlobeTrotter',
      email: 'globe@example.com',
      avatarUrl: null,
      bio: 'Travel enthusiast',
    );

    setState(() {
      _posts.addAll([
        TravelPost(
          id: '1',
          author: mockUser1,
          title: 'Amazing Sunset in Santorini',
          content: 'Just witnessed the most beautiful sunset in Santorini. The colors were absolutely breathtaking! The whole experience was magical and I highly recommend visiting this place at least once in your lifetime.',
          location: 'Santorini, Greece',
          videoUrl: 'assets/hovonaatravel/hovonaa1/hovonaaVideo.mp4',
          category: 'Beaches & Islands',
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          likesCount: 124,
          commentsCount: 23,
          tags: ['sunset', 'greece', 'santorini'],
        ),
        TravelPost(
          id: '2',
          author: mockUser2,
          title: 'Tokyo Street Food Adventure',
          content: 'Spent the whole day exploring Tokyo\'s street food scene. From takoyaki to ramen, every bite was incredible. The food culture here is something else!',
          location: 'Tokyo, Japan',
          videoUrl: 'assets/hovonaatravel/hovonaa2/hovonaaVideo.mp4',
          category: 'Food & Culture',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          likesCount: 89,
          commentsCount: 15,
          tags: ['food', 'tokyo', 'japan'],
        ),
        TravelPost(
          id: '3',
          author: mockUser3,
          title: 'Hiking in the Swiss Alps',
          content: 'Completed an amazing hiking trail in the Swiss Alps today. The views were absolutely stunning and the fresh mountain air was invigorating. This is what dreams are made of!',
          location: 'Swiss Alps, Switzerland',
          videoUrl: 'assets/hovonaatravel/hovonaa3/hovonaaVideo.mp4',
          category: 'Adventure',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          likesCount: 156,
          commentsCount: 31,
          tags: ['hiking', 'mountains', 'switzerland'],
        ),
        TravelPost(
          id: '4',
          author: mockUser1,
          title: 'Beach Paradise in Maldives',
          content: 'Crystal clear waters and white sandy beaches. The Maldives is truly a paradise on earth. Perfect for relaxation and water activities.',
          location: 'Maldives',
          videoUrl: 'assets/hovonaatravel/hovonaa4/hovonaaVideo.mp4',
          category: 'Relaxation',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          likesCount: 203,
          commentsCount: 42,
          tags: ['beach', 'maldives', 'paradise'],
        ),
        TravelPost(
          id: '5',
          author: mockUser2,
          title: 'Exploring Ancient Rome',
          content: 'Walking through the Colosseum and Roman Forum was like stepping back in time. The history and architecture are absolutely fascinating.',
          location: 'Rome, Italy',
          videoUrl: 'assets/hovonaatravel/hovonaa5/hovonaaVideo.mp4',
          category: 'History & Culture',
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
          likesCount: 178,
          commentsCount: 28,
          tags: ['history', 'rome', 'italy'],
        ),
      ]);
    });
  }

  void _handleLike(String postId) {
    setState(() {
      if (_likedPosts.contains(postId)) {
        _likedPosts.remove(postId);
        final post = _posts.firstWhere((p) => p.id == postId);
        final index = _posts.indexOf(post);
        _posts[index] = post.copyWith(likesCount: post.likesCount - 1);
      } else {
        _likedPosts.add(postId);
        final post = _posts.firstWhere((p) => p.id == postId);
        final index = _posts.indexOf(post);
        _posts[index] = post.copyWith(likesCount: post.likesCount + 1);
      }
    });
  }

  Future<void> _navigateToCreatePost() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreatePostScreen()),
    );

    if (result != null && result is TravelPost) {
      setState(() {
        _posts.insert(0, result);
      });
    }
  }

  Future<void> _navigateToPost(TravelPost post) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => post.hasVideo
            ? FullscreenVideoPlayerScreen(post: post)
            : PostDetailScreen(post: post),
      ),
    );

    if (result == true) {
      await _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hovonaa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
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
        child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _visiblePosts.isEmpty
              ? const Center(
                  child: Text('No posts yet. Start sharing your travels!'),
                )
              : RefreshIndicator(
                  onRefresh: _loadData,
                  child: ListView.builder(
                    itemCount: _visiblePosts.length,
                    itemBuilder: (context, index) {
                      final post = _visiblePosts[index];
                      return PostCard(
                        post: post,
                        isLiked: _likedPosts.contains(post.id),
                        onLike: () => _handleLike(post.id),
                        onTap: () => _navigateToPost(post),
                      );
              },
            ),
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreatePost,
        child: const Icon(Icons.add),
      ),
    );
  }
}

