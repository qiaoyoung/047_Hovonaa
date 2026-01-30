import 'package:flutter/material.dart';
import '../models/city_guide.dart';
import '../services/favorite_city_storage.dart';
import 'city_detail_screen.dart';

class FavoriteCitiesScreen extends StatefulWidget {
  const FavoriteCitiesScreen({super.key});

  @override
  State<FavoriteCitiesScreen> createState() => _FavoriteCitiesScreenState();
}

class _FavoriteCitiesScreenState extends State<FavoriteCitiesScreen> {
  List<CityGuide> _favoriteCities = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() {
      _isLoading = true;
    });

    final favoriteIds = await FavoriteCityStorage.getFavoriteCityIds();
    final allCities = _getAllCityGuides();
    
    final favorites = allCities.where((city) => favoriteIds.contains(city.id)).toList();

    if (mounted) {
      setState(() {
        _favoriteCities = favorites;
        _isLoading = false;
      });
    }
  }

  List<CityGuide> _getAllCityGuides() {
    // This should match the data from CityGuideScreen
    // In a real app, this would come from a shared data source or API
    return [
      // Weekly Featured Cities
      CityGuide(
        id: '1',
        cityName: 'Santorini',
        country: 'Greece',
        coverImageUrl: 'https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?w=800&q=80',
        description: 'A stunning Greek island known for its white-washed buildings, blue domes, and breathtaking sunsets.',
        rating: 4.8,
        reviewCount: 125,
        highlights: ['Oia Sunset', 'Red Beach', 'Wine Tasting', 'Ancient Thera'],
        travelTips: {
          'Best Time': 'April to October',
          'Currency': 'Euro (EUR)',
          'Language': 'Greek, English',
          'Transportation': 'Rent a car or use local buses',
        },
        bestTimeToVisit: ['April', 'May', 'September', 'October'],
        mustVisitPlaces: ['Oia Village', 'Fira Town', 'Red Beach', 'Akrotiri Archaeological Site', 'Santo Wines Winery'],
        localFoods: ['Fava (Yellow Split Pea Puree)', 'Tomato Keftedes', 'Fresh Seafood', 'Greek Salad', 'Local Wine'],
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        isWeeklyFeatured: true,
        recommendedMonth: 'September',
        recommendedDays: 3,
        dailyItinerary: [
          DailyItinerary(
            day: 1,
            title: 'Arrival & Fira Exploration',
            activities: [
              ActivityStep(
                time: '10:00',
                activity: 'Arrival & Hotel Check-in',
                description: 'Arrive at Santorini Airport or Port, transfer to your hotel in Fira. Settle in and enjoy the stunning caldera views.',
                location: 'Fira Town',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Fira Town Walking Tour',
                description: 'Explore the narrow cobblestone streets, white-washed buildings, and blue-domed churches. Visit local shops and art galleries.',
                location: 'Fira Center',
              ),
              ActivityStep(
                time: '16:00',
                activity: 'Cable Car to Old Port',
                description: 'Take the cable car down to the old port or walk the famous 600 steps. Enjoy fresh seafood at waterfront tavernas.',
                location: 'Old Port',
              ),
              ActivityStep(
                time: '19:00',
                activity: 'Sunset at Fira',
                description: 'Return to Fira and watch the sunset from one of the cliffside restaurants or bars with panoramic caldera views.',
                location: 'Fira Caldera Edge',
              ),
            ],
            accommodation: 'Cave Hotel in Fira with Caldera View',
            meals: 'Lunch in Fira, Seafood dinner at Old Port',
          ),
          DailyItinerary(
            day: 2,
            title: 'Oia & Wine Tasting',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Morning at Red Beach',
                description: 'Visit the famous Red Beach near Akrotiri. Swim in crystal-clear waters surrounded by dramatic red volcanic cliffs.',
                location: 'Red Beach, Akrotiri',
              ),
              ActivityStep(
                time: '12:00',
                activity: 'Akrotiri Archaeological Site',
                description: 'Explore the ancient Minoan city preserved by volcanic ash, often called the "Pompeii of the Aegean".',
                location: 'Akrotiri Excavations',
              ),
              ActivityStep(
                time: '14:30',
                activity: 'Wine Tasting Tour',
                description: 'Visit Santo Wines or Venetsanos Winery. Taste unique volcanic wines like Assyrtiko while enjoying caldera views.',
                location: 'Santo Wines Winery',
              ),
              ActivityStep(
                time: '17:00',
                activity: 'Oia Village Exploration',
                description: 'Wander through the picturesque village of Oia, visit art galleries, boutiques, and the famous blue domes.',
                location: 'Oia Village',
              ),
              ActivityStep(
                time: '19:30',
                activity: 'World-Famous Oia Sunset',
                description: 'Experience the most spectacular sunset in the world from Oia castle ruins. Arrive early to secure a good spot.',
                location: 'Oia Castle',
              ),
            ],
            accommodation: 'Cave Hotel in Fira',
            meals: 'Breakfast at hotel, Lunch near Akrotiri, Dinner in Oia',
          ),
          DailyItinerary(
            day: 3,
            title: 'Volcano & Hot Springs',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Catamaran Cruise',
                description: 'Morning sailing cruise around Santorini, visit the volcanic islands of Nea Kameni and Palea Kameni.',
                location: 'Santorini Caldera',
              ),
              ActivityStep(
                time: '11:00',
                activity: 'Volcano Hike',
                description: 'Hike up the active volcano of Nea Kameni, see sulfur vents and volcanic craters up close.',
                location: 'Nea Kameni Volcano',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Hot Springs Swimming',
                description: 'Swim in the therapeutic hot springs with warm, sulfur-rich waters near Palea Kameni.',
                location: 'Palea Kameni Hot Springs',
              ),
              ActivityStep(
                time: '15:00',
                activity: 'BBQ Lunch on Board',
                description: 'Enjoy a delicious BBQ meal on the catamaran while sailing past the caldera cliffs.',
                location: 'Catamaran',
              ),
              ActivityStep(
                time: '17:00',
                activity: 'Last Shopping & Departure Prep',
                description: 'Return to Fira for last-minute souvenir shopping, pack, and prepare for departure.',
                location: 'Fira Town',
              ),
            ],
            accommodation: 'N/A (Evening departure)',
            meals: 'Breakfast at hotel, BBQ lunch on cruise, Light dinner before departure',
          ),
        ],
      ),
      CityGuide(
        id: '2',
        cityName: 'Tokyo',
        country: 'Japan',
        coverImageUrl: 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800&q=80',
        description: 'A vibrant metropolis blending traditional culture with cutting-edge technology. From ancient temples to futuristic districts, Tokyo offers endless exploration.',
        rating: 4.9,
        reviewCount: 189,
        highlights: ['Shibuya Crossing', 'Senso-ji Temple', 'Tsukiji Market', 'Tokyo Skytree'],
        travelTips: {
          'Best Time': 'March to May, September to November',
          'Currency': 'Japanese Yen (JPY)',
          'Language': 'Japanese, English in tourist areas',
          'Transportation': 'JR Pass, Metro, Taxi',
        },
        bestTimeToVisit: ['March', 'April', 'May', 'September', 'October', 'November'],
        mustVisitPlaces: ['Shibuya District', 'Senso-ji Temple', 'Tsukiji Outer Market', 'Tokyo Skytree', 'Meiji Shrine', 'Harajuku'],
        localFoods: ['Sushi', 'Ramen', 'Takoyaki', 'Tempura', 'Wagyu Beef', 'Matcha Desserts'],
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        isWeeklyFeatured: true,
        recommendedMonth: 'April',
        recommendedDays: 5,
        dailyItinerary: [
          DailyItinerary(
            day: 1,
            title: 'Arrival & Shibuya District',
            activities: [
              ActivityStep(
                time: '12:00',
                activity: 'Arrival & Hotel Check-in',
                description: 'Arrive at Narita/Haneda Airport, take the airport express to your hotel in Shinjuku. Rest and freshen up.',
                location: 'Shinjuku',
              ),
              ActivityStep(
                time: '16:00',
                activity: 'Shibuya Crossing Experience',
                description: 'Visit the world\'s busiest pedestrian crossing. Take photos from Starbucks rooftop and explore Shibuya 109.',
                location: 'Shibuya Station',
              ),
              ActivityStep(
                time: '18:00',
                activity: 'Harajuku Fashion Street',
                description: 'Walk down Takeshita Street, experience kawaii culture, try crepes, and visit trendy boutiques.',
                location: 'Harajuku',
              ),
              ActivityStep(
                time: '20:00',
                activity: 'Shinjuku Nightlife',
                description: 'Explore Kabukicho entertainment district, visit Golden Gai\'s tiny bars, and see the neon lights.',
                location: 'Shinjuku',
              ),
            ],
            accommodation: 'Hotel in Shinjuku',
            meals: 'Airport snacks, Dinner at Ichiran Ramen Shibuya',
          ),
          DailyItinerary(
            day: 2,
            title: 'Traditional Tokyo',
            activities: [
              ActivityStep(
                time: '07:00',
                activity: 'Tsukiji Outer Market',
                description: 'Experience the bustling market atmosphere, try fresh sushi for breakfast, and explore street food stalls.',
                location: 'Tsukiji',
              ),
              ActivityStep(
                time: '10:00',
                activity: 'Senso-ji Temple',
                description: 'Visit Tokyo\'s oldest temple, walk through Kaminarimon Gate, explore Nakamise shopping street.',
                location: 'Asakusa',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Tokyo Skytree',
                description: 'Ascend the world\'s tallest tower for panoramic city views from 450m high. Visit the aquarium at the base.',
                location: 'Tokyo Skytree',
              ),
              ActivityStep(
                time: '17:00',
                activity: 'Sumida River Cruise',
                description: 'Take a relaxing river cruise from Asakusa to Odaiba, enjoying cherry blossoms (in season) along the way.',
                location: 'Sumida River',
              ),
              ActivityStep(
                time: '19:30',
                activity: 'Odaiba Island',
                description: 'See the Rainbow Bridge lit up, visit teamLab Borderless digital art museum, and see the Gundam statue.',
                location: 'Odaiba',
              ),
            ],
            accommodation: 'Hotel in Shinjuku',
            meals: 'Breakfast at Tsukiji, Lunch near Skytree, Dinner at Odaiba',
          ),
          DailyItinerary(
            day: 3,
            title: 'Modern Tokyo & Pop Culture',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Meiji Shrine',
                description: 'Visit Tokyo\'s most important Shinto shrine, walk through the tranquil forest, and see traditional wedding ceremonies.',
                location: 'Harajuku',
              ),
              ActivityStep(
                time: '11:30',
                activity: 'Yoyogi Park',
                description: 'Stroll through the beautiful park, watch street performers, and experience local culture.',
                location: 'Yoyogi',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Akihabara Electric Town',
                description: 'Explore the anime and manga paradise, visit maid cafes, retro game stores, and electronics shops.',
                location: 'Akihabara',
              ),
              ActivityStep(
                time: '16:00',
                activity: 'Imperial Palace Gardens',
                description: 'Walk through the East Gardens of the Imperial Palace, see the historic moats and bridges.',
                location: 'Imperial Palace',
              ),
              ActivityStep(
                time: '19:00',
                activity: 'Ginza Shopping & Dining',
                description: 'Experience luxury shopping district, visit flagship stores, and enjoy high-end dining.',
                location: 'Ginza',
              ),
            ],
            accommodation: 'Hotel in Shinjuku',
            meals: 'Breakfast at hotel, Lunch in Akihabara, Dinner at Ginza',
          ),
          DailyItinerary(
            day: 4,
            title: 'Day Trip to Mount Fuji',
            activities: [
              ActivityStep(
                time: '07:00',
                activity: 'Depart for Mount Fuji',
                description: 'Take JR train or tour bus to Kawaguchiko. Enjoy scenic views of Mount Fuji on the journey.',
                location: 'Lake Kawaguchiko',
              ),
              ActivityStep(
                time: '10:00',
                activity: 'Chureito Pagoda',
                description: 'Climb 400 steps to the iconic pagoda for the classic Mt. Fuji photo with cherry blossoms.',
                location: 'Fujiyoshida',
              ),
              ActivityStep(
                time: '12:30',
                activity: 'Lake Kawaguchiko Cruise',
                description: 'Take a boat cruise on the lake with stunning reflections of Mount Fuji in clear weather.',
                location: 'Lake Kawaguchiko',
              ),
              ActivityStep(
                time: '14:30',
                activity: 'Oshino Hakkai Village',
                description: 'Visit traditional thatched-roof houses and crystal-clear spring water ponds.',
                location: 'Oshino Hakkai',
              ),
              ActivityStep(
                time: '18:00',
                activity: 'Return to Tokyo',
                description: 'Take the train back to Tokyo, rest at hotel or explore nearby neighborhood.',
                location: 'Tokyo',
              ),
            ],
            accommodation: 'Hotel in Shinjuku',
            meals: 'Breakfast at hotel, Lunch at Kawaguchiko, Dinner in Shinjuku',
          ),
          DailyItinerary(
            day: 5,
            title: 'Last Day Shopping & Departure',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Ueno Park & Museums',
                description: 'Visit Tokyo National Museum or Ueno Zoo, stroll through the park enjoying cherry blossoms.',
                location: 'Ueno',
              ),
              ActivityStep(
                time: '12:00',
                activity: 'Last-Minute Shopping',
                description: 'Visit Don Quijote or Tokyu Hands for unique souvenirs, snacks, and gifts.',
                location: 'Shinjuku',
              ),
              ActivityStep(
                time: '15:00',
                activity: 'Hotel Check-out',
                description: 'Pack up, check out, and store luggage at hotel or station lockers.',
                location: 'Shinjuku',
              ),
              ActivityStep(
                time: '16:30',
                activity: 'Airport Transfer',
                description: 'Take the Narita Express or Monorail to the airport for departure flight.',
                location: 'Narita/Haneda Airport',
              ),
            ],
            accommodation: 'N/A',
            meals: 'Breakfast at hotel, Lunch in Ueno, Airport food',
          ),
        ],
      ),
      CityGuide(
        id: '3',
        cityName: 'Bali',
        country: 'Indonesia',
        coverImageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800&q=80',
        description: 'The Island of Gods offers stunning beaches, lush rice terraces, ancient temples, and a rich cultural heritage. A perfect blend of relaxation and adventure.',
        rating: 4.7,
        reviewCount: 152,
        highlights: ['Ubud Rice Terraces', 'Tanah Lot Temple', 'Seminyak Beach', 'Mount Batur'],
        travelTips: {
          'Best Time': 'April to October',
          'Currency': 'Indonesian Rupiah (IDR)',
          'Language': 'Indonesian, English',
          'Transportation': 'Scooter rental, Private driver',
        },
        bestTimeToVisit: ['April', 'May', 'June', 'July', 'August', 'September', 'October'],
        mustVisitPlaces: ['Tegallalang Rice Terraces', 'Tanah Lot Temple', 'Ubud Monkey Forest', 'Seminyak Beach', 'Mount Batur', 'Tirta Empul Temple'],
        localFoods: ['Nasi Goreng', 'Babi Guling', 'Satay', 'Gado-Gado', 'Bebek Betutu', 'Fresh Coconut'],
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
        isWeeklyFeatured: true,
        recommendedMonth: 'July',
        recommendedDays: 6,
        dailyItinerary: [
          DailyItinerary(
            day: 1,
            title: 'Arrival & Seminyak Beach',
            activities: [
              ActivityStep(
                time: '14:00',
                activity: 'Arrival & Villa Check-in',
                description: 'Arrive at Ngurah Rai Airport, transfer to your beachfront villa in Seminyak. Welcome drink and relaxation.',
                location: 'Seminyak',
              ),
              ActivityStep(
                time: '17:00',
                activity: 'Seminyak Beach Sunset',
                description: 'Walk along the golden sand beach, enjoy beach clubs, and watch the spectacular sunset.',
                location: 'Seminyak Beach',
              ),
              ActivityStep(
                time: '19:30',
                activity: 'Welcome Dinner',
                description: 'Enjoy fresh seafood at a beachfront restaurant like La Plancha or Ku De Ta.',
                location: 'Seminyak Beach',
              ),
            ],
            accommodation: 'Private Villa in Seminyak',
            meals: 'Inflight meals, Seafood dinner at beach club',
          ),
          DailyItinerary(
            day: 2,
            title: 'Ubud Cultural Experience',
            activities: [
              ActivityStep(
                time: '08:00',
                activity: 'Tegallalang Rice Terraces',
                description: 'Visit the iconic stepped rice paddies, try the jungle swing, and enjoy coffee plantation tour.',
                location: 'Tegallalang',
              ),
              ActivityStep(
                time: '11:00',
                activity: 'Tirta Empul Holy Water Temple',
                description: 'Experience the sacred water purification ritual, explore the temple complex.',
                location: 'Tampaksiring',
              ),
              ActivityStep(
                time: '14:00',
                activity: 'Ubud Monkey Forest',
                description: 'Walk through the lush forest sanctuary, interact with friendly long-tailed macaques.',
                location: 'Ubud',
              ),
              ActivityStep(
                time: '16:00',
                activity: 'Ubud Royal Palace',
                description: 'Visit the historic palace and explore Ubud\'s art market for handmade crafts and souvenirs.',
                location: 'Ubud Center',
              ),
              ActivityStep(
                time: '19:00',
                activity: 'Traditional Kecak Dance',
                description: 'Watch the mesmerizing fire dance performance at Ubud Palace or Uluwatu Temple.',
                location: 'Ubud Palace',
              ),
            ],
            accommodation: 'Private Villa in Seminyak',
            meals: 'Breakfast at villa, Lunch in Ubud, Dinner at Locavore',
          ),
          DailyItinerary(
            day: 3,
            title: 'Mount Batur Sunrise Trek',
            activities: [
              ActivityStep(
                time: '03:00',
                activity: 'Depart for Mount Batur',
                description: 'Early morning pickup from villa, drive 2 hours to the base of Mount Batur volcano.',
                location: 'Mount Batur Base',
              ),
              ActivityStep(
                time: '05:30',
                activity: 'Summit Sunrise',
                description: 'Reach the summit just in time for spectacular sunrise views over Lake Batur and Mount Agung.',
                location: 'Mount Batur Summit (1,717m)',
              ),
              ActivityStep(
                time: '08:00',
                activity: 'Breakfast at Summit',
                description: 'Enjoy eggs cooked in volcanic steam and hot drinks while taking in the panoramic views.',
                location: 'Mount Batur Summit',
              ),
              ActivityStep(
                time: '11:00',
                activity: 'Coffee Plantation Visit',
                description: 'Return trek and visit nearby Luwak coffee plantation, try various coffee and tea samples.',
                location: 'Kintamani',
              ),
              ActivityStep(
                time: '15:00',
                activity: 'Rest & Spa Treatment',
                description: 'Return to villa, rest from early morning trek, and enjoy a traditional Balinese massage.',
                location: 'Seminyak',
              ),
            ],
            accommodation: 'Private Villa in Seminyak',
            meals: 'Summit breakfast, Late lunch at villa, Light dinner',
          ),
          DailyItinerary(
            day: 4,
            title: 'Beach Clubs & Water Sports',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Water Sports at Tanjung Benoa',
                description: 'Try jet skiing, parasailing, banana boat, and flyboarding in the calm waters.',
                location: 'Tanjung Benoa',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Uluwatu Temple',
                description: 'Visit the clifftop temple perched 70m above the ocean, watch monkeys, and explore the grounds.',
                location: 'Uluwatu',
              ),
              ActivityStep(
                time: '16:30',
                activity: 'Padang Padang Beach',
                description: 'Relax at this hidden gem beach, swim in turquoise waters surrounded by rock formations.',
                location: 'Padang Padang',
              ),
              ActivityStep(
                time: '18:30',
                activity: 'Sunset Kecak Dance at Uluwatu',
                description: 'Watch the fire dance performance with the ocean and sunset as backdrop.',
                location: 'Uluwatu Temple',
              ),
              ActivityStep(
                time: '20:30',
                activity: 'Jimbaran Seafood Dinner',
                description: 'Enjoy grilled seafood with your feet in the sand at Jimbaran Beach.',
                location: 'Jimbaran Bay',
              ),
            ],
            accommodation: 'Private Villa in Seminyak',
            meals: 'Breakfast at villa, Lunch at Uluwatu, Seafood dinner at Jimbaran',
          ),
          DailyItinerary(
            day: 5,
            title: 'North Bali Waterfalls & Temples',
            activities: [
              ActivityStep(
                time: '08:00',
                activity: 'Handara Gate',
                description: 'Visit the iconic Instagram-famous Balinese gate with mountain backdrop.',
                location: 'Bedugul',
              ),
              ActivityStep(
                time: '10:00',
                activity: 'Ulun Danu Beratan Temple',
                description: 'Explore the water temple on Lake Beratan, one of Bali\'s most photographed temples.',
                location: 'Bedugul',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Sekumpul Waterfall Trek',
                description: 'Hike through jungle and rice fields to reach Bali\'s most beautiful waterfall, swim in the pool.',
                location: 'Singaraja',
              ),
              ActivityStep(
                time: '16:00',
                activity: 'Lovina Beach Dolphins',
                description: 'Relax at the black sand beach, optional dolphin-watching tour booking for next morning.',
                location: 'Lovina',
              ),
              ActivityStep(
                time: '18:00',
                activity: 'Return to Seminyak',
                description: 'Scenic drive back through rice paddies and villages.',
                location: 'Seminyak',
              ),
            ],
            accommodation: 'Private Villa in Seminyak',
            meals: 'Breakfast at villa, Lunch near waterfall, Dinner in Seminyak',
          ),
          DailyItinerary(
            day: 6,
            title: 'Relaxation & Departure',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Yoga & Breakfast',
                description: 'Morning yoga session by the pool, followed by healthy tropical breakfast.',
                location: 'Villa',
              ),
              ActivityStep(
                time: '11:00',
                activity: 'Last Beach Time',
                description: 'Final swim and sunbathing at Seminyak Beach or villa pool.',
                location: 'Seminyak',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Shopping & Souvenirs',
                description: 'Last-minute shopping at Seminyak Village or beachside boutiques.',
                location: 'Seminyak',
              ),
              ActivityStep(
                time: '16:00',
                activity: 'Airport Transfer',
                description: 'Check out from villa and transfer to airport for departure.',
                location: 'Ngurah Rai Airport',
              ),
            ],
            accommodation: 'N/A',
            meals: 'Breakfast at villa, Light lunch, Airport food',
          ),
        ],
      ),
      // Monthly Recommended Cities
      CityGuide(
        id: '4',
        cityName: 'Dubai',
        country: 'UAE',
        coverImageUrl: 'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800&q=80',
        description: 'A modern marvel in the desert, combining luxury, innovation, and culture. Known for world-class shopping, stunning architecture, and desert adventures.',
        rating: 4.7,
        reviewCount: 164,
        highlights: ['Burj Khalifa', 'Palm Jumeirah', 'Dubai Mall', 'Desert Safari'],
        travelTips: {
          'Best Time': 'November to March',
          'Currency': 'UAE Dirham (AED)',
          'Language': 'Arabic, English',
          'Transportation': 'Metro, Taxi, Uber',
        },
        bestTimeToVisit: ['November', 'December', 'January', 'February', 'March'],
        mustVisitPlaces: ['Burj Khalifa', 'Dubai Mall', 'Palm Jumeirah', 'Dubai Marina', 'Gold Souk', 'Desert Safari'],
        localFoods: ['Shawarma', 'Hummus', 'Falafel', 'Kunafa', 'Arabic Coffee', 'Dates'],
        updatedAt: DateTime.now().subtract(const Duration(days: 4)),
        isWeeklyFeatured: false,
        recommendedMonth: 'January',
        recommendedDays: 4,
        dailyItinerary: [
          DailyItinerary(
            day: 1,
            title: 'Arrival & Downtown Dubai',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Arrival & Hotel Check-in',
                description: 'Arrive at Dubai International Airport, transfer to your hotel in Downtown Dubai. Take some time to rest and freshen up.',
                location: 'Downtown Dubai',
              ),
              ActivityStep(
                time: '14:00',
                activity: 'Dubai Mall Exploration',
                description: 'Visit the world\'s largest shopping mall. Explore Dubai Aquarium, see the indoor waterfall, and enjoy shopping.',
                location: 'Dubai Mall',
              ),
              ActivityStep(
                time: '18:00',
                activity: 'Burj Khalifa At The Top',
                description: 'Watch the sunset from the 124th & 125th floor observation deck. Experience breathtaking 360° views of the city.',
                location: 'Burj Khalifa',
              ),
              ActivityStep(
                time: '20:00',
                activity: 'Dubai Fountain Show',
                description: 'Watch the spectacular Dubai Fountain show with water dancing to music. Best viewed from Dubai Mall terrace.',
                location: 'Dubai Fountain',
              ),
            ],
            accommodation: 'Downtown Dubai Hotel (4-5 stars)',
            meals: 'Lunch at Dubai Mall, Dinner at At.mosphere (Burj Khalifa)',
          ),
          DailyItinerary(
            day: 2,
            title: 'Desert Safari & Old Dubai',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Gold & Spice Souk',
                description: 'Explore the traditional markets of Old Dubai. Wander through lanes of gold shops and aromatic spice vendors.',
                location: 'Deira - Gold Souk & Spice Souk',
              ),
              ActivityStep(
                time: '11:30',
                activity: 'Al Fahidi Historical District',
                description: 'Walk through Dubai\'s heritage quarter, visit Dubai Museum, and experience traditional wind-tower architecture.',
                location: 'Al Fahidi District',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Abra Ride & Lunch',
                description: 'Take a traditional water taxi across Dubai Creek. Enjoy lunch at a local restaurant.',
                location: 'Dubai Creek',
              ),
              ActivityStep(
                time: '15:00',
                activity: 'Desert Safari Adventure',
                description: 'Dune bashing in 4x4 vehicles, camel riding, sandboarding, and watch a stunning desert sunset.',
                location: 'Dubai Desert Conservation Reserve',
              ),
              ActivityStep(
                time: '19:00',
                activity: 'Bedouin Camp Experience',
                description: 'BBQ dinner, belly dance show, henna painting, and stargazing in a traditional Bedouin-style camp.',
                location: 'Desert Camp',
              ),
            ],
            accommodation: 'Downtown Dubai Hotel',
            meals: 'Breakfast at hotel, Lunch in Old Dubai, BBQ dinner in desert',
          ),
          DailyItinerary(
            day: 3,
            title: 'Palm Jumeirah & Marina',
            activities: [
              ActivityStep(
                time: '10:00',
                activity: 'Atlantis The Palm',
                description: 'Visit the iconic resort, explore The Lost Chambers Aquarium, and enjoy the beach.',
                location: 'Palm Jumeirah',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Lunch at Palm',
                description: 'Enjoy Mediterranean cuisine with stunning views of the Arabian Gulf.',
                location: 'The Pointe, Palm Jumeirah',
              ),
              ActivityStep(
                time: '15:30',
                activity: 'Dubai Marina Walk',
                description: 'Stroll along the 7km promenade lined with cafes, restaurants, and luxury yachts.',
                location: 'Dubai Marina',
              ),
              ActivityStep(
                time: '17:30',
                activity: 'Dhow Cruise Marina',
                description: 'Enjoy a sunset dhow cruise with dinner, sailing past modern skyscrapers and yacht clubs.',
                location: 'Dubai Marina',
              ),
              ActivityStep(
                time: '20:30',
                activity: 'JBR Beach Walk',
                description: 'Evening walk at Jumeirah Beach Residence, street performers, and night market shopping.',
                location: 'JBR - The Beach',
              ),
            ],
            accommodation: 'Downtown Dubai Hotel',
            meals: 'Breakfast at hotel, Lunch at The Pointe, Dinner cruise',
          ),
          DailyItinerary(
            day: 4,
            title: 'Modern Dubai & Departure',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Museum of the Future',
                description: 'Explore this architectural marvel showcasing innovation and future technologies.',
                location: 'Sheikh Zayed Road',
              ),
              ActivityStep(
                time: '12:00',
                activity: 'City Walk Shopping',
                description: 'Last-minute shopping at this outdoor lifestyle destination with street art and cafes.',
                location: 'City Walk',
              ),
              ActivityStep(
                time: '14:00',
                activity: 'La Mer Beach',
                description: 'Relax at the beach, enjoy water sports, or grab a bite at beachfront restaurants.',
                location: 'La Mer',
              ),
              ActivityStep(
                time: '17:00',
                activity: 'Hotel Check-out & Airport Transfer',
                description: 'Pack up, check out from hotel, and transfer to Dubai International Airport for departure.',
                location: 'Dubai International Airport',
              ),
            ],
            accommodation: 'N/A',
            meals: 'Breakfast at hotel, Lunch at City Walk, Airport snacks',
          ),
        ],
      ),
      CityGuide(
        id: '5',
        cityName: 'Paris',
        country: 'France',
        coverImageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800&q=80',
        description: 'The City of Light, known for its art, fashion, gastronomy, and culture. Home to iconic landmarks and world-class museums.',
        rating: 4.6,
        reviewCount: 223,
        highlights: ['Eiffel Tower', 'Louvre Museum', 'Notre-Dame', 'Champs-Élysées'],
        travelTips: {
          'Best Time': 'April to June, September to October',
          'Currency': 'Euro (EUR)',
          'Language': 'French, English',
          'Transportation': 'Metro, Bus, Walking',
        },
        bestTimeToVisit: ['April', 'May', 'June', 'September', 'October'],
        mustVisitPlaces: ['Eiffel Tower', 'Louvre Museum', 'Notre-Dame Cathedral', 'Arc de Triomphe', 'Montmartre', 'Seine River Cruise'],
        localFoods: ['Croissant', 'Macarons', 'Escargot', 'Coq au Vin', 'Crêpes', 'French Wine'],
        updatedAt: DateTime.now().subtract(const Duration(days: 5)),
        isWeeklyFeatured: false,
        recommendedMonth: 'May',
        recommendedDays: 4,
        dailyItinerary: [
          DailyItinerary(
            day: 1,
            title: 'Iconic Paris',
            activities: [
              ActivityStep(
                time: '10:00',
                activity: 'Eiffel Tower',
                description: 'Visit the iconic Iron Lady. Take the elevator to the top for panoramic views of Paris.',
                location: 'Champ de Mars',
              ),
              ActivityStep(
                time: '13:00',
                activity: 'Seine River Cruise',
                description: 'Enjoy a relaxing lunch cruise along the Seine, passing by major landmarks.',
                location: 'Seine River',
              ),
              ActivityStep(
                time: '15:30',
                activity: 'Champs-Élysées',
                description: 'Stroll down the famous avenue, visit luxury boutiques and cafes.',
                location: 'Champs-Élysées',
              ),
              ActivityStep(
                time: '18:00',
                activity: 'Arc de Triomphe',
                description: 'Climb to the top for sunset views. See the Tomb of the Unknown Soldier.',
                location: 'Place Charles de Gaulle',
              ),
            ],
            accommodation: 'Hotel in Marais District',
            meals: 'Breakfast at hotel, Lunch cruise, Dinner near Arc de Triomphe',
          ),
          DailyItinerary(
            day: 2,
            title: 'Art & Culture',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Louvre Museum',
                description: 'Explore the world\'s largest art museum. See Mona Lisa, Venus de Milo, and thousands of masterpieces.',
                location: 'Louvre',
              ),
              ActivityStep(
                time: '14:00',
                activity: 'Tuileries Garden',
                description: 'Relax in the beautiful gardens between Louvre and Place de la Concorde.',
                location: 'Jardin des Tuileries',
              ),
              ActivityStep(
                time: '16:00',
                activity: 'Musée d\'Orsay',
                description: 'Visit the impressionist art museum housed in a former railway station.',
                location: 'Musée d\'Orsay',
              ),
              ActivityStep(
                time: '19:00',
                activity: 'Latin Quarter',
                description: 'Explore the bohemian quarter, visit bookshops, and enjoy dinner at a bistro.',
                location: 'Quartier Latin',
              ),
            ],
            accommodation: 'Hotel in Marais District',
            meals: 'Breakfast at hotel, Light lunch, Dinner in Latin Quarter',
          ),
          DailyItinerary(
            day: 3,
            title: 'Montmartre & Versailles',
            activities: [
              ActivityStep(
                time: '08:00',
                activity: 'Palace of Versailles',
                description: 'Day trip to the magnificent royal palace. Tour the Hall of Mirrors and gardens.',
                location: 'Versailles',
              ),
              ActivityStep(
                time: '15:00',
                activity: 'Return to Paris',
                description: 'Take the train back to Paris and rest at hotel.',
                location: 'Paris',
              ),
              ActivityStep(
                time: '17:00',
                activity: 'Montmartre',
                description: 'Climb to the artistic neighborhood, visit Sacré-Cœur Basilica.',
                location: 'Montmartre',
              ),
              ActivityStep(
                time: '19:30',
                activity: 'Moulin Rouge Area',
                description: 'Explore Pigalle district, optional cabaret show booking.',
                location: 'Pigalle',
              ),
            ],
            accommodation: 'Hotel in Marais District',
            meals: 'Breakfast at hotel, Lunch at Versailles, Dinner in Montmartre',
          ),
          DailyItinerary(
            day: 4,
            title: 'Shopping & Departure',
            activities: [
              ActivityStep(
                time: '09:00',
                activity: 'Le Marais Shopping',
                description: 'Explore trendy boutiques, vintage shops, and art galleries.',
                location: 'Le Marais',
              ),
              ActivityStep(
                time: '12:00',
                activity: 'Notre-Dame Area',
                description: 'Visit the cathedral exterior and Île de la Cité.',
                location: 'Île de la Cité',
              ),
              ActivityStep(
                time: '14:00',
                activity: 'Last Macarons',
                description: 'Visit Ladurée or Pierre Hermé for last-minute gifts.',
                location: 'Saint-Germain',
              ),
              ActivityStep(
                time: '17:00',
                activity: 'Airport Transfer',
                description: 'Check out and take RER to Charles de Gaulle Airport.',
                location: 'CDG Airport',
              ),
            ],
            accommodation: 'N/A',
            meals: 'Breakfast at hotel, Lunch at café, Airport snacks',
          ),
        ],
      ),
      CityGuide(
        id: '6',
        cityName: 'New York',
        country: 'USA',
        coverImageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=800&q=80',
        description: 'The city that never sleeps, offering endless entertainment, culture, and iconic landmarks.',
        rating: 4.8,
        reviewCount: 298,
        highlights: ['Statue of Liberty', 'Central Park', 'Times Square', 'Brooklyn Bridge'],
        travelTips: {
          'Best Time': 'April to June, September to November',
          'Currency': 'US Dollar (USD)',
          'Language': 'English',
          'Transportation': 'Subway, Taxi, Walking',
        },
        bestTimeToVisit: ['April', 'May', 'June', 'September', 'October', 'November'],
        mustVisitPlaces: ['Statue of Liberty', 'Central Park', 'Times Square', 'Empire State Building', 'Brooklyn Bridge', 'Metropolitan Museum'],
        localFoods: ['New York Pizza', 'Bagels', 'Hot Dogs', 'Cheesecake', 'Pastrami Sandwich', 'Street Pretzels'],
        updatedAt: DateTime.now().subtract(const Duration(days: 6)),
        isWeeklyFeatured: false,
      ),
      CityGuide(
        id: '7',
        cityName: 'Barcelona',
        country: 'Spain',
        coverImageUrl: 'https://images.unsplash.com/photo-1583422409516-2895a77efded?w=800&q=80',
        description: 'A vibrant Mediterranean city famous for Gaudí\'s architecture and beautiful beaches.',
        rating: 4.7,
        reviewCount: 187,
        highlights: ['Sagrada Familia', 'Park Güell', 'La Rambla', 'Gothic Quarter'],
        travelTips: {
          'Best Time': 'May to June, September to October',
          'Currency': 'Euro (EUR)',
          'Language': 'Spanish, Catalan, English',
          'Transportation': 'Metro, Bus, Walking',
        },
        bestTimeToVisit: ['May', 'June', 'September', 'October'],
        mustVisitPlaces: ['Sagrada Familia', 'Park Güell', 'La Rambla', 'Gothic Quarter', 'Casa Batlló', 'Barceloneta Beach'],
        localFoods: ['Tapas', 'Paella', 'Jamón Ibérico', 'Crema Catalana', 'Pan con Tomate', 'Sangria'],
        updatedAt: DateTime.now().subtract(const Duration(days: 7)),
        isWeeklyFeatured: false,
      ),
      CityGuide(
        id: '8',
        cityName: 'Sydney',
        country: 'Australia',
        coverImageUrl: 'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=800&q=80',
        description: 'Australia\'s largest city with iconic landmarks, beautiful harbors, and stunning beaches.',
        rating: 4.8,
        reviewCount: 176,
        highlights: ['Opera House', 'Harbour Bridge', 'Bondi Beach', 'The Rocks'],
        travelTips: {
          'Best Time': 'September to November, March to May',
          'Currency': 'Australian Dollar (AUD)',
          'Language': 'English',
          'Transportation': 'Ferry, Train, Bus',
        },
        bestTimeToVisit: ['September', 'October', 'November', 'March', 'April', 'May'],
        mustVisitPlaces: ['Sydney Opera House', 'Harbour Bridge', 'Bondi Beach', 'Darling Harbour', 'The Rocks', 'Royal Botanic Garden'],
        localFoods: ['Meat Pie', 'Fish and Chips', 'Lamington', 'Pavlova', 'Vegemite', 'Tim Tam'],
        updatedAt: DateTime.now().subtract(const Duration(days: 8)),
        isWeeklyFeatured: false,
      ),
      CityGuide(
        id: '9',
        cityName: 'Rome',
        country: 'Italy',
        coverImageUrl: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800&q=80',
        description: 'The Eternal City with ancient ruins, Renaissance art, and delicious cuisine.',
        rating: 4.9,
        reviewCount: 245,
        highlights: ['Colosseum', 'Vatican', 'Trevi Fountain', 'Roman Forum'],
        travelTips: {
          'Best Time': 'April to June, September to October',
          'Currency': 'Euro (EUR)',
          'Language': 'Italian, English',
          'Transportation': 'Metro, Bus, Walking',
        },
        bestTimeToVisit: ['April', 'May', 'June', 'September', 'October'],
        mustVisitPlaces: ['Colosseum', 'Vatican Museums', 'Trevi Fountain', 'Roman Forum', 'Pantheon', 'Spanish Steps'],
        localFoods: ['Pasta Carbonara', 'Pizza Margherita', 'Gelato', 'Cacio e Pepe', 'Supplì', 'Tiramisu'],
        updatedAt: DateTime.now().subtract(const Duration(days: 9)),
        isWeeklyFeatured: false,
      ),
      CityGuide(
        id: '10',
        cityName: 'London',
        country: 'UK',
        coverImageUrl: 'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800&q=80',
        description: 'A historic capital blending royal heritage with modern culture and world-class museums.',
        rating: 4.7,
        reviewCount: 234,
        highlights: ['Big Ben', 'Tower Bridge', 'British Museum', 'Buckingham Palace'],
        travelTips: {
          'Best Time': 'March to May, September to November',
          'Currency': 'British Pound (GBP)',
          'Language': 'English',
          'Transportation': 'Underground (Tube), Bus, Black Cab',
        },
        bestTimeToVisit: ['March', 'April', 'May', 'September', 'October', 'November'],
        mustVisitPlaces: ['Big Ben', 'Tower Bridge', 'British Museum', 'Buckingham Palace', 'London Eye', 'Tower of London'],
        localFoods: ['Fish and Chips', 'Full English Breakfast', 'Afternoon Tea', 'Shepherd\'s Pie', 'Bangers and Mash', 'Sunday Roast'],
        updatedAt: DateTime.now().subtract(const Duration(days: 10)),
        isWeeklyFeatured: false,
      ),
      CityGuide(
        id: '11',
        cityName: 'Bangkok',
        country: 'Thailand',
        coverImageUrl: 'https://images.unsplash.com/photo-1563492065599-3520f775eeed?w=800&q=80',
        description: 'A vibrant city with ornate temples, bustling markets, and incredible street food.',
        rating: 4.6,
        reviewCount: 201,
        highlights: ['Grand Palace', 'Wat Pho', 'Floating Markets', 'Khao San Road'],
        travelTips: {
          'Best Time': 'November to February',
          'Currency': 'Thai Baht (THB)',
          'Language': 'Thai, English in tourist areas',
          'Transportation': 'BTS, MRT, Tuk-tuk, Taxi',
        },
        bestTimeToVisit: ['November', 'December', 'January', 'February'],
        mustVisitPlaces: ['Grand Palace', 'Wat Pho', 'Wat Arun', 'Chatuchak Market', 'Floating Markets', 'Khao San Road'],
        localFoods: ['Pad Thai', 'Tom Yum Goong', 'Green Curry', 'Mango Sticky Rice', 'Som Tam', 'Satay'],
        updatedAt: DateTime.now().subtract(const Duration(days: 11)),
        isWeeklyFeatured: false,
      ),
      CityGuide(
        id: '12',
        cityName: 'Amsterdam',
        country: 'Netherlands',
        coverImageUrl: 'https://images.unsplash.com/photo-1534351590666-13e3e96b5017?w=800&q=80',
        description: 'A charming city of canals, bikes, art museums, and historic architecture.',
        rating: 4.7,
        reviewCount: 178,
        highlights: ['Canal Cruise', 'Anne Frank House', 'Van Gogh Museum', 'Rijksmuseum'],
        travelTips: {
          'Best Time': 'April to May, September to November',
          'Currency': 'Euro (EUR)',
          'Language': 'Dutch, English',
          'Transportation': 'Bike, Tram, Walking',
        },
        bestTimeToVisit: ['April', 'May', 'September', 'October', 'November'],
        mustVisitPlaces: ['Canal Cruise', 'Anne Frank House', 'Van Gogh Museum', 'Rijksmuseum', 'Vondelpark', 'Dam Square'],
        localFoods: ['Stroopwafel', 'Bitterballen', 'Herring', 'Dutch Cheese', 'Poffertjes', 'Frites'],
        updatedAt: DateTime.now().subtract(const Duration(days: 12)),
        isWeeklyFeatured: false,
      ),
      CityGuide(
        id: '13',
        cityName: 'Istanbul',
        country: 'Turkey',
        coverImageUrl: 'https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800&q=80',
        description: 'A city spanning two continents with rich history, stunning mosques, and vibrant bazaars.',
        rating: 4.8,
        reviewCount: 192,
        highlights: ['Hagia Sophia', 'Blue Mosque', 'Grand Bazaar', 'Bosphorus'],
        travelTips: {
          'Best Time': 'April to May, September to November',
          'Currency': 'Turkish Lira (TRY)',
          'Language': 'Turkish, English in tourist areas',
          'Transportation': 'Tram, Metro, Ferry',
        },
        bestTimeToVisit: ['April', 'May', 'September', 'October', 'November'],
        mustVisitPlaces: ['Hagia Sophia', 'Blue Mosque', 'Grand Bazaar', 'Topkapi Palace', 'Bosphorus Cruise', 'Spice Bazaar'],
        localFoods: ['Kebab', 'Baklava', 'Turkish Delight', 'Börek', 'Meze', 'Turkish Tea'],
        updatedAt: DateTime.now().subtract(const Duration(days: 13)),
        isWeeklyFeatured: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Cities'),
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
            : _favoriteCities.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No favorite cities yet',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Start exploring and save your favorites!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _loadFavorites,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _favoriteCities.length,
                      itemBuilder: (context, index) {
                        final city = _favoriteCities[index];
                        return _buildCityCard(city);
                      },
                    ),
                  ),
      ),
    );
  }

  Widget _buildCityCard(CityGuide city) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CityDetailScreen(cityGuide: city),
            ),
          );
          // Refresh the list when returning in case favorites changed
          _loadFavorites();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              city.coverImageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city.fullLocation,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        '${city.rating}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${city.reviewCount})',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    city.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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

