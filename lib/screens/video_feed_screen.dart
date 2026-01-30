import 'package:flutter/material.dart';
import '../models/travel_video.dart';
import '../models/user.dart';
import '../widgets/video_card.dart';
import '../services/hidden_video_storage.dart';
import 'video_fullscreen_player_screen.dart';

class VideoFeedScreen extends StatefulWidget {
  const VideoFeedScreen({super.key});

  @override
  State<VideoFeedScreen> createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  final List<TravelVideo> _videos = [];
  final Set<String> _likedVideos = {};
  Set<String> _hiddenVideoIds = {};
  List<TravelVideo> _visibleVideos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVideos();
    _loadData(showLoading: true);
  }

  List<TravelVideo> get visibleVideos => _visibleVideos;

  Future<void> _loadData({bool showLoading = false}) async {
    if (mounted && showLoading) {
      setState(() {
        _isLoading = true;
      });
    }
    
    final hiddenIds = await HiddenVideoStorage.getHiddenVideoIds();
    debugPrint('Loaded hidden video IDs: $hiddenIds');
    
    if (!mounted) return;
    
    setState(() {
      _hiddenVideoIds = hiddenIds;
      _updateVisibleVideos();
      if (showLoading) {
        _isLoading = false;
      }
    });
    
    debugPrint('Updated hidden video IDs in state: $_hiddenVideoIds');
    debugPrint('Total videos: ${_videos.length}, Visible videos: ${_visibleVideos.length}');
  }

  void _updateVisibleVideos() {
    _visibleVideos = _videos.where((video) => !_hiddenVideoIds.contains(video.id)).toList();
  }

  void _loadVideos() {
    final users = [
      User(
        id: '1',
        username: 'BeachWanderer',
        email: 'beach@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa1/hovonaaPic.jpg',
        bio: 'Ocean lover and beach explorer',
      ),
      User(
        id: '2',
        username: 'MountainSeeker',
        email: 'mountain@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa2/hovonaaPic.jpg',
        bio: 'Chasing peaks and adventures',
      ),
      User(
        id: '3',
        username: 'CityExplorer',
        email: 'city@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa3/hovonaaPic.jpg',
        bio: 'Urban travel enthusiast',
      ),
      User(
        id: '4',
        username: 'FoodieNomad',
        email: 'foodie@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa4/hovonaaPic.jpg',
        bio: 'Traveling for flavors',
      ),
      User(
        id: '5',
        username: 'SunsetChaser',
        email: 'sunset@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa5/hovonaaPic.jpg',
        bio: 'Capturing golden hours',
      ),
      User(
        id: '6',
        username: 'WildernessRover',
        email: 'wilderness@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa6/hovonaaPic.jpg',
        bio: 'Into the wild',
      ),
      User(
        id: '7',
        username: 'CoastalDrifter',
        email: 'coastal@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa7/hovonaaPic.jpg',
        bio: 'Living by the sea',
      ),
      User(
        id: '8',
        username: 'DesertWanderer',
        email: 'desert@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa8/hovonaaPic.jpg',
        bio: 'Exploring arid wonders',
      ),
      User(
        id: '9',
        username: 'IslandHopper',
        email: 'island@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa9/hovonaaPic.jpg',
        bio: 'From island to island',
      ),
      User(
        id: '10',
        username: 'ForestSeeker',
        email: 'forest@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa10/hovonaaPic.jpg',
        bio: 'Among the trees',
      ),
      User(
        id: '11',
        username: 'SnowChaser',
        email: 'snow@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa11/hovonaaPic.jpg',
        bio: 'Winter wonderland lover',
      ),
      User(
        id: '12',
        username: 'TropicTraveler',
        email: 'tropic@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa12/hovonaaPic.jpg',
        bio: 'Tropical paradise hunter',
      ),
      User(
        id: '13',
        username: 'HistoricNomad',
        email: 'historic@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa13/hovonaaPic.jpg',
        bio: 'Time traveling through history',
      ),
      User(
        id: '14',
        username: 'WaterfallChaser',
        email: 'waterfall@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa14/hovonaaPic.jpg',
        bio: 'Following the flow',
      ),
      User(
        id: '15',
        username: 'SkylineLover',
        email: 'skyline@example.com',
        avatarUrl: 'assets/hovonaatravel/hovonaa15/hovonaaPic.jpg',
        bio: 'Urban skyline enthusiast',
      ),
    ];

    final locations = [
      'Bali, Indonesia',
      'Swiss Alps, Switzerland',
      'Tokyo, Japan',
      'Bangkok, Thailand',
      'Santorini, Greece',
      'Iceland',
      'Maldives',
      'Dubai, UAE',
      'Hawaii, USA',
      'Amazon Rainforest',
      'Patagonia, Chile',
      'Bora Bora, French Polynesia',
      'Rome, Italy',
      'New Zealand',
      'New York, USA',
    ];

    final titles = [
      'Paradise Beach Discovery',
      'Mountain Peak Adventure',
      'Urban Night Life Experience',
      'Street Food Journey',
      'Sunset Paradise Views',
      'Wild Nature Exploration',
      'Coastal Beauty Tour',
      'Desert Dunes Adventure',
      'Island Hopping Experience',
      'Forest Trail Discovery',
      'Snow Mountain Adventure',
      'Tropical Paradise Tour',
      'Ancient City Exploration',
      'Waterfall Wonder Journey',
      'Skyline Night Views',
    ];

    final descriptions = [
      'Discovering the most beautiful beaches with crystal clear waters and white sandy shores.',
      'Climbing to the peak with breathtaking views of the surrounding landscape.',
      'Experiencing the vibrant city life, culture, and amazing architecture.',
      'Tasting authentic local street food and discovering culinary treasures.',
      'Witnessing the most spectacular sunset views with stunning colors.',
      'Exploring untouched wilderness and encountering amazing wildlife.',
      'Walking along stunning coastal paths with ocean views.',
      'Adventuring through vast desert landscapes and sand dunes.',
      'Hopping between beautiful tropical islands and hidden gems.',
      'Hiking through lush green forests and discovering nature\'s beauty.',
      'Experiencing snow-covered mountains and winter wonderland.',
      'Relaxing in tropical paradise with palm trees and turquoise waters.',
      'Walking through ancient streets filled with history and culture.',
      'Chasing majestic waterfalls and natural water wonders.',
      'Enjoying spectacular city skyline views from iconic viewpoints.',
    ];

    final tagsList = [
      ['beach', 'paradise', 'tropical', 'ocean'],
      ['mountain', 'hiking', 'adventure', 'nature'],
      ['city', 'urban', 'nightlife', 'culture'],
      ['food', 'street food', 'culinary', 'local'],
      ['sunset', 'photography', 'scenic', 'beauty'],
      ['wildlife', 'nature', 'wilderness', 'adventure'],
      ['coastal', 'ocean', 'scenic', 'nature'],
      ['desert', 'adventure', 'landscape', 'unique'],
      ['island', 'tropical', 'beach', 'paradise'],
      ['forest', 'nature', 'hiking', 'green'],
      ['snow', 'winter', 'mountain', 'adventure'],
      ['tropical', 'paradise', 'beach', 'relaxation'],
      ['history', 'culture', 'ancient', 'architecture'],
      ['waterfall', 'nature', 'scenic', 'adventure'],
      ['skyline', 'city', 'urban', 'night'],
    ];

    setState(() {
      for (int i = 1; i <= 15; i++) {
        _videos.add(
          TravelVideo(
            id: i.toString(),
            author: users[i - 1],
            title: titles[i - 1],
            description: descriptions[i - 1],
            videoUrl: 'assets/hovonaatravel/hovonaa$i/hovonaaVideo.mp4',
            thumbnailUrl: 'assets/hovonaatravel/hovonaa$i/hovonaaPic.jpg',
            location: locations[i - 1],
            createdAt: DateTime.now().subtract(Duration(hours: i * 2)),
            viewsCount: 50000 + (i * 12000),
            likesCount: 3000 + (i * 500),
            commentsCount: 100 + (i * 15),
            sharesCount: 50 + (i * 10),
            tags: tagsList[i - 1],
            isRecommended: i <= 10,
          ),
        );
      }
      _updateVisibleVideos();
    });
  }

  void _handleLike(String videoId) {
    setState(() {
      if (_likedVideos.contains(videoId)) {
        _likedVideos.remove(videoId);
        final video = _videos.firstWhere((v) => v.id == videoId);
        final index = _videos.indexOf(video);
        _videos[index] = TravelVideo(
          id: video.id,
          author: video.author,
          title: video.title,
          description: video.description,
          videoUrl: video.videoUrl,
          thumbnailUrl: video.thumbnailUrl,
          location: video.location,
          createdAt: video.createdAt,
          viewsCount: video.viewsCount,
          likesCount: video.likesCount - 1,
          commentsCount: video.commentsCount,
          sharesCount: video.sharesCount,
          tags: video.tags,
          isRecommended: video.isRecommended,
        );
      } else {
        _likedVideos.add(videoId);
        final video = _videos.firstWhere((v) => v.id == videoId);
        final index = _videos.indexOf(video);
        _videos[index] = TravelVideo(
          id: video.id,
          author: video.author,
          title: video.title,
          description: video.description,
          videoUrl: video.videoUrl,
          thumbnailUrl: video.thumbnailUrl,
          location: video.location,
          createdAt: video.createdAt,
          viewsCount: video.viewsCount,
          likesCount: video.likesCount + 1,
          commentsCount: video.commentsCount,
          sharesCount: video.sharesCount,
          tags: video.tags,
          isRecommended: video.isRecommended,
        );
      }
    });
  }

  Future<void> _navigateToVideo(TravelVideo video) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VideoFullscreenPlayerScreen(
          video: video,
        ),
      ),
    );
    
    debugPrint('Video navigation result: $result');
    
    if (result == true && mounted) {
      debugPrint('Reloading data after video hidden');
      final hiddenIds = await HiddenVideoStorage.getHiddenVideoIds();
      debugPrint('Loaded hidden video IDs: $hiddenIds');
      
      if (mounted) {
        setState(() {
          _hiddenVideoIds = hiddenIds;
          _updateVisibleVideos();
        });
        debugPrint('Updated hidden video IDs in state: $_hiddenVideoIds');
        debugPrint('Total videos: ${_videos.length}, Visible videos: ${_visibleVideos.length}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : visibleVideos.isEmpty
                ? const Center(
                    child: Text('No videos available'),
                  )
                : RefreshIndicator(
                    onRefresh: _loadData,
                    child: ListView.builder(
                      key: ValueKey(_hiddenVideoIds.length),
                      itemCount: visibleVideos.length,
                      itemBuilder: (context, index) {
                        final video = visibleVideos[index];
                        return VideoCard(
                          video: video,
                          isLiked: _likedVideos.contains(video.id),
                          onLike: () => _handleLike(video.id),
                          onTap: () => _navigateToVideo(video),
                        );
                  },
                ),
              ),
        ),
      ),
    );
  }
}
