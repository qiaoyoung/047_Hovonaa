import 'package:flutter/material.dart';
import '../models/city_guide.dart';
import 'city_detail_screen.dart';

class CityGuideScreen extends StatefulWidget {
  const CityGuideScreen({super.key});

  @override
  State<CityGuideScreen> createState() => _CityGuideScreenState();
}

class _CityGuideScreenState extends State<CityGuideScreen> {
  final List<CityGuide> _cityGuides = [];

  @override
  void initState() {
    super.initState();
    _loadMockCityGuides();
  }

  void _loadMockCityGuides() {
    setState(() {
      _cityGuides.addAll([
        CityGuide(
          id: '1',
          cityName: 'Santorini',
          country: 'Greece',
          coverImageUrl: 'https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?w=800&q=80',
          description: 'A stunning Greek island known for its white-washed buildings, blue domes, and breathtaking sunsets. Perfect for romantic getaways and photography enthusiasts.',
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
          mustVisitPlaces: [
            'Oia Village',
            'Fira Town',
            'Red Beach',
            'Akrotiri Archaeological Site',
            'Santo Wines Winery',
          ],
          localFoods: [
            'Fava (Yellow Split Pea Puree)',
            'Tomato Keftedes',
            'Fresh Seafood',
            'Greek Salad',
            'Local Wine',
          ],
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
          mustVisitPlaces: [
            'Shibuya District',
            'Senso-ji Temple',
            'Tsukiji Outer Market',
            'Tokyo Skytree',
            'Meiji Shrine',
            'Harajuku',
          ],
          localFoods: [
            'Sushi',
            'Ramen',
            'Takoyaki',
            'Tempura',
            'Wagyu Beef',
            'Matcha Desserts',
          ],
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
          mustVisitPlaces: [
            'Tegallalang Rice Terraces',
            'Tanah Lot Temple',
            'Ubud Monkey Forest',
            'Seminyak Beach',
            'Mount Batur',
            'Tirta Empul Temple',
          ],
          localFoods: [
            'Nasi Goreng',
            'Babi Guling',
            'Satay',
            'Gado-Gado',
            'Bebek Betutu',
            'Fresh Coconut',
          ],
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
          mustVisitPlaces: [
            'Burj Khalifa',
            'Dubai Mall',
            'Palm Jumeirah',
            'Dubai Marina',
            'Gold Souk',
            'Desert Safari',
          ],
          localFoods: [
            'Shawarma',
            'Hummus',
            'Falafel',
            'Kunafa',
            'Arabic Coffee',
            'Dates',
          ],
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
          mustVisitPlaces: [
            'Eiffel Tower',
            'Louvre Museum',
            'Notre-Dame Cathedral',
            'Arc de Triomphe',
            'Montmartre',
            'Seine River Cruise',
          ],
          localFoods: [
            'Croissant',
            'Macarons',
            'Escargot',
            'Coq au Vin',
            'Crêpes',
            'French Wine',
          ],
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
          description: 'The city that never sleeps. A melting pot of cultures, iconic landmarks, world-class entertainment, and endless dining options.',
          rating: 4.5,
          reviewCount: 198,
          highlights: ['Statue of Liberty', 'Central Park', 'Times Square', 'Brooklyn Bridge'],
          travelTips: {
            'Best Time': 'April to June, September to November',
            'Currency': 'US Dollar (USD)',
            'Language': 'English',
            'Transportation': 'Subway, Taxi, Walking',
          },
          bestTimeToVisit: ['April', 'May', 'June', 'September', 'October', 'November'],
          mustVisitPlaces: [
            'Statue of Liberty',
            'Central Park',
            'Times Square',
            'Brooklyn Bridge',
            'Empire State Building',
            'Metropolitan Museum',
          ],
          localFoods: [
            'New York Pizza',
            'Bagels',
            'Hot Dogs',
            'Cheesecake',
            'Pastrami Sandwich',
            'Food Truck Tacos',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 6)),
          isWeeklyFeatured: false,
          recommendedMonth: 'October',
          recommendedDays: 5,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Manhattan Landmarks',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Times Square',
                  description: 'Start at the heart of NYC. See the bright billboards and bustling atmosphere.',
                  location: 'Times Square',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Empire State Building',
                  description: 'Visit the iconic skyscraper. Take the elevator to the observation deck.',
                  location: '350 Fifth Avenue',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Bryant Park & NYPL',
                  description: 'Relax in the park and visit the stunning New York Public Library.',
                  location: 'Midtown Manhattan',
                ),
                ActivityStep(
                  time: '16:30',
                  activity: 'Grand Central Terminal',
                  description: 'Explore the beautiful Beaux-Arts railway terminal.',
                  location: '89 East 42nd Street',
                ),
                ActivityStep(
                  time: '19:00',
                  activity: 'Broadway Show',
                  description: 'Watch a world-class musical or play on Broadway.',
                  location: 'Theater District',
                ),
              ],
              accommodation: 'Hotel in Midtown',
              meals: 'Breakfast at hotel, NYC Pizza lunch, Pre-theater dinner',
            ),
            DailyItinerary(
              day: 2,
              title: 'Statue of Liberty & Downtown',
              activities: [
                ActivityStep(
                  time: '08:00',
                  activity: 'Statue of Liberty Ferry',
                  description: 'Take the morning ferry to Liberty Island. Explore the statue and museum.',
                  location: 'Liberty Island',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Ellis Island',
                  description: 'Visit the Immigration Museum and learn about American history.',
                  location: 'Ellis Island',
                ),
                ActivityStep(
                  time: '15:00',
                  activity: '9/11 Memorial & Museum',
                  description: 'Pay respects at the memorial pools and visit the moving museum.',
                  location: 'World Trade Center',
                ),
                ActivityStep(
                  time: '18:00',
                  activity: 'Brooklyn Bridge Walk',
                  description: 'Walk across the iconic bridge at sunset for stunning Manhattan views.',
                  location: 'Brooklyn Bridge',
                ),
                ActivityStep(
                  time: '20:00',
                  activity: 'DUMBO Dinner',
                  description: 'Enjoy dinner in Brooklyn with bridge views.',
                  location: 'DUMBO, Brooklyn',
                ),
              ],
              accommodation: 'Hotel in Midtown',
              meals: 'Breakfast at hotel, Lunch near Battery Park, Dinner in Brooklyn',
            ),
            DailyItinerary(
              day: 3,
              title: 'Museums & Central Park',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Metropolitan Museum of Art',
                  description: 'Spend the morning exploring one of the world\'s greatest art museums.',
                  location: 'Upper East Side',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Central Park',
                  description: 'Walk through the park, visit Bethesda Terrace, Bow Bridge, and Strawberry Fields.',
                  location: 'Central Park',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'American Museum of Natural History',
                  description: 'Explore dinosaur fossils, space exhibits, and cultural halls.',
                  location: 'Upper West Side',
                ),
                ActivityStep(
                  time: '19:00',
                  activity: 'Upper West Side Dinner',
                  description: 'Enjoy dinner at a classic NYC restaurant.',
                  location: 'Upper West Side',
                ),
              ],
              accommodation: 'Hotel in Midtown',
              meals: 'Breakfast at hotel, Hot dog in Central Park, Dinner Upper West Side',
            ),
            DailyItinerary(
              day: 4,
              title: 'Chelsea, High Line & Village',
              activities: [
                ActivityStep(
                  time: '10:00',
                  activity: 'High Line Park',
                  description: 'Walk the elevated park built on old rail tracks with art installations.',
                  location: 'Chelsea',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Chelsea Market',
                  description: 'Browse food vendors, shops, and grab lunch.',
                  location: 'Chelsea Market',
                ),
                ActivityStep(
                  time: '14:30',
                  activity: 'Greenwich Village',
                  description: 'Explore the bohemian neighborhood, Washington Square Park.',
                  location: 'Greenwich Village',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'SoHo Shopping',
                  description: 'Browse high-end boutiques and art galleries in SoHo.',
                  location: 'SoHo',
                ),
                ActivityStep(
                  time: '20:00',
                  activity: 'Little Italy Dinner',
                  description: 'Enjoy authentic Italian cuisine in Little Italy.',
                  location: 'Little Italy',
                ),
              ],
              accommodation: 'Hotel in Midtown',
              meals: 'Breakfast at hotel, Lunch at Chelsea Market, Dinner Little Italy',
            ),
            DailyItinerary(
              day: 5,
              title: 'Shopping & Departure',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Fifth Avenue Shopping',
                  description: 'Visit flagship stores like Apple, Tiffany\'s, Saks Fifth Avenue.',
                  location: 'Fifth Avenue',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Rockefeller Center',
                  description: 'See the famous plaza, Top of the Rock optional if time permits.',
                  location: 'Rockefeller Center',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Last NYC Bagel',
                  description: 'Grab a classic NYC bagel before departure.',
                  location: 'Midtown',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Airport Transfer',
                  description: 'Take taxi or train to JFK or Newark Airport.',
                  location: 'Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Bagel lunch, Airport food',
            ),
          ],
        ),
        CityGuide(
          id: '7',
          cityName: 'Barcelona',
          country: 'Spain',
          coverImageUrl: 'https://images.unsplash.com/photo-1583422409516-2895a77efded?w=800&q=80',
          description: 'A vibrant coastal city known for Gaudí architecture, beaches, and lively street culture. Perfect blend of art, history, and Mediterranean lifestyle.',
          rating: 4.7,
          reviewCount: 175,
          highlights: ['Sagrada Familia', 'Park Güell', 'La Rambla', 'Gothic Quarter'],
          travelTips: {
            'Best Time': 'May to June, September to October',
            'Currency': 'Euro (EUR)',
            'Language': 'Spanish, Catalan, English',
            'Transportation': 'Metro, Bus, Walking',
          },
          bestTimeToVisit: ['May', 'June', 'September', 'October'],
          mustVisitPlaces: [
            'Sagrada Familia',
            'Park Güell',
            'Casa Batlló',
            'La Rambla',
            'Gothic Quarter',
            'Barceloneta Beach',
          ],
          localFoods: [
            'Paella',
            'Tapas',
            'Jamón Ibérico',
            'Churros',
            'Sangria',
            'Pan con Tomate',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 7)),
          isWeeklyFeatured: false,
          recommendedMonth: 'June',
          recommendedDays: 4,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Gaudí\'s Masterpieces',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Sagrada Familia',
                  description: 'Visit Gaudí\'s unfinished masterpiece. Marvel at the stunning architecture and stained glass.',
                  location: 'Eixample',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Casa Batlló',
                  description: 'Explore the dragon house with its colorful facade and innovative design.',
                  location: 'Passeig de Gràcia',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'La Pedrera (Casa Milà)',
                  description: 'Visit another Gaudí building with a unique wavy facade and rooftop.',
                  location: 'Passeig de Gràcia',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Park Güell',
                  description: 'Explore the colorful park with mosaic sculptures and city views.',
                  location: 'Gràcia',
                ),
              ],
              accommodation: 'Hotel in Gothic Quarter',
              meals: 'Breakfast at hotel, Tapas lunch, Dinner in Gràcia',
            ),
            DailyItinerary(
              day: 2,
              title: 'Gothic Quarter & Las Ramblas',
              activities: [
                ActivityStep(
                  time: '10:00',
                  activity: 'Barcelona Cathedral',
                  description: 'Visit the Gothic cathedral and walk through the charming old streets.',
                  location: 'Gothic Quarter',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'La Rambla',
                  description: 'Stroll down the famous pedestrian street, see street performers.',
                  location: 'La Rambla',
                ),
                ActivityStep(
                  time: '13:30',
                  activity: 'La Boqueria Market',
                  description: 'Explore the vibrant food market, sample fresh fruits and local delicacies.',
                  location: 'La Rambla',
                ),
                ActivityStep(
                  time: '15:30',
                  activity: 'El Born District',
                  description: 'Wander through trendy boutiques, galleries, and cafes.',
                  location: 'El Born',
                ),
                ActivityStep(
                  time: '18:00',
                  activity: 'Picasso Museum',
                  description: 'Visit the museum housing one of the most extensive Picasso collections.',
                  location: 'El Born',
                ),
              ],
              accommodation: 'Hotel in Gothic Quarter',
              meals: 'Breakfast at hotel, Market lunch, Tapas dinner',
            ),
            DailyItinerary(
              day: 3,
              title: 'Beach & Montjuïc',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Barceloneta Beach',
                  description: 'Relax on the sandy beach, swim in the Mediterranean.',
                  location: 'Barceloneta',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Seafood Lunch',
                  description: 'Enjoy fresh paella or seafood at a beachfront restaurant.',
                  location: 'Barceloneta',
                ),
                ActivityStep(
                  time: '15:00',
                  activity: 'Montjuïc Cable Car',
                  description: 'Take the cable car up to Montjuïc for panoramic city views.',
                  location: 'Montjuïc',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Montjuïc Castle',
                  description: 'Explore the historic fortress with stunning views.',
                  location: 'Montjuïc',
                ),
                ActivityStep(
                  time: '20:00',
                  activity: 'Magic Fountain Show',
                  description: 'Watch the spectacular light and music fountain show.',
                  location: 'Plaça d\'Espanya',
                ),
              ],
              accommodation: 'Hotel in Gothic Quarter',
              meals: 'Breakfast at hotel, Paella lunch, Light dinner',
            ),
            DailyItinerary(
              day: 4,
              title: 'FC Barcelona & Departure',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Camp Nou Stadium',
                  description: 'Tour the legendary FC Barcelona stadium and museum.',
                  location: 'Les Corts',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Shopping at Portal de l\'Àngel',
                  description: 'Last-minute shopping on Barcelona\'s main shopping street.',
                  location: 'Ciutat Vella',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Final Tapas',
                  description: 'Enjoy one last round of tapas and sangria.',
                  location: 'Gothic Quarter',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Airport Transfer',
                  description: 'Take Aerobus to Barcelona-El Prat Airport.',
                  location: 'BCN Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Tapas lunch, Airport snacks',
            ),
          ],
        ),
        CityGuide(
          id: '8',
          cityName: 'Rome',
          country: 'Italy',
          coverImageUrl: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800&q=80',
          description: 'The Eternal City, where ancient history meets modern life. Home to millennia of art, architecture, and culinary excellence.',
          rating: 4.6,
          reviewCount: 201,
          highlights: ['Colosseum', 'Vatican City', 'Trevi Fountain', 'Roman Forum'],
          travelTips: {
            'Best Time': 'April to June, September to October',
            'Currency': 'Euro (EUR)',
            'Language': 'Italian, English',
            'Transportation': 'Metro, Bus, Walking',
          },
          bestTimeToVisit: ['April', 'May', 'June', 'September', 'October'],
          mustVisitPlaces: [
            'Colosseum',
            'Vatican Museums',
            'Sistine Chapel',
            'Trevi Fountain',
            'Pantheon',
            'Spanish Steps',
          ],
          localFoods: [
            'Carbonara',
            'Cacio e Pepe',
            'Gelato',
            'Pizza al Taglio',
            'Supplì',
            'Tiramisu',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 8)),
          isWeeklyFeatured: false,
          recommendedMonth: 'May',
          recommendedDays: 4,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Ancient Rome',
              activities: [
                ActivityStep(
                  time: '08:30',
                  activity: 'Colosseum',
                  description: 'Visit the iconic amphitheater early to avoid crowds. Explore the underground chambers.',
                  location: 'Colosseum',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Roman Forum',
                  description: 'Walk through the ancient ruins of Rome\'s political and social center.',
                  location: 'Roman Forum',
                ),
                ActivityStep(
                  time: '13:30',
                  activity: 'Palatine Hill',
                  description: 'Climb the hill where Rome was founded, enjoy panoramic views.',
                  location: 'Palatine Hill',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Capitoline Museums',
                  description: 'Visit Rome\'s oldest public museums with impressive art collections.',
                  location: 'Capitoline Hill',
                ),
              ],
              accommodation: 'Hotel near Termini',
              meals: 'Breakfast at hotel, Pizza al taglio lunch, Carbonara dinner',
            ),
            DailyItinerary(
              day: 2,
              title: 'Vatican City',
              activities: [
                ActivityStep(
                  time: '08:00',
                  activity: 'Vatican Museums',
                  description: 'Enter early to explore the vast art collection. Don\'t miss the Gallery of Maps.',
                  location: 'Vatican City',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Sistine Chapel',
                  description: 'Marvel at Michelangelo\'s ceiling frescoes and The Last Judgment.',
                  location: 'Vatican City',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'St. Peter\'s Basilica',
                  description: 'Visit the world\'s largest church. Climb the dome for stunning views.',
                  location: 'Vatican City',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Castel Sant\'Angelo',
                  description: 'Explore the ancient fortress with panoramic city views from the top.',
                  location: 'Castel Sant\'Angelo',
                ),
              ],
              accommodation: 'Hotel near Termini',
              meals: 'Breakfast at hotel, Light lunch near Vatican, Dinner in Trastevere',
            ),
            DailyItinerary(
              day: 3,
              title: 'Baroque Rome',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Trevi Fountain',
                  description: 'Toss a coin into the famous fountain and admire the baroque sculpture.',
                  location: 'Trevi',
                ),
                ActivityStep(
                  time: '10:30',
                  activity: 'Pantheon',
                  description: 'Visit the ancient temple with the world\'s largest unreinforced concrete dome.',
                  location: 'Pantheon',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Piazza Navona',
                  description: 'Relax in the baroque square with three fountains and street artists.',
                  location: 'Piazza Navona',
                ),
                ActivityStep(
                  time: '14:30',
                  activity: 'Spanish Steps',
                  description: 'Climb the famous stairway and shop at high-end boutiques.',
                  location: 'Piazza di Spagna',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Villa Borghese',
                  description: 'Stroll through the beautiful park and visit Borghese Gallery if time permits.',
                  location: 'Villa Borghese',
                ),
              ],
              accommodation: 'Hotel near Termini',
              meals: 'Breakfast at hotel, Lunch near Pantheon, Gelato and light dinner',
            ),
            DailyItinerary(
              day: 4,
              title: 'Trastevere & Departure',
              activities: [
                ActivityStep(
                  time: '10:00',
                  activity: 'Trastevere District',
                  description: 'Wander through the charming medieval neighborhood with narrow streets.',
                  location: 'Trastevere',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Market at Campo de\' Fiori',
                  description: 'Visit the lively morning market for last souvenirs.',
                  location: 'Campo de\' Fiori',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Final Italian Meal',
                  description: 'Enjoy one last authentic Italian lunch with tiramisu.',
                  location: 'Centro Storico',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Airport Transfer',
                  description: 'Take Leonardo Express train to Fiumicino Airport.',
                  location: 'FCO Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Italian lunch, Airport snacks',
            ),
          ],
        ),
        CityGuide(
          id: '9',
          cityName: 'Bangkok',
          country: 'Thailand',
          coverImageUrl: 'https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800&q=80',
          description: 'A bustling metropolis known for ornate shrines, vibrant street life, amazing street food, and colorful markets.',
          rating: 4.5,
          reviewCount: 168,
          highlights: ['Grand Palace', 'Wat Arun', 'Floating Market', 'Chatuchak Market'],
          travelTips: {
            'Best Time': 'November to February',
            'Currency': 'Thai Baht (THB)',
            'Language': 'Thai, English in tourist areas',
            'Transportation': 'BTS, MRT, Tuk-tuk, Taxi',
          },
          bestTimeToVisit: ['November', 'December', 'January', 'February'],
          mustVisitPlaces: [
            'Grand Palace',
            'Wat Pho',
            'Wat Arun',
            'Chatuchak Weekend Market',
            'Floating Market',
            'Khao San Road',
          ],
          localFoods: [
            'Pad Thai',
            'Tom Yum Goong',
            'Green Curry',
            'Mango Sticky Rice',
            'Som Tam',
            'Street Food',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 9)),
          isWeeklyFeatured: false,
          recommendedMonth: 'December',
          recommendedDays: 4,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Temples & Grand Palace',
              activities: [
                ActivityStep(
                  time: '08:00',
                  activity: 'Grand Palace',
                  description: 'Visit the spectacular royal complex with the Emerald Buddha Temple.',
                  location: 'Rattanakosin',
                ),
                ActivityStep(
                  time: '11:30',
                  activity: 'Wat Pho',
                  description: 'See the giant Reclining Buddha and enjoy a traditional Thai massage.',
                  location: 'Phra Nakhon',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Chao Phraya River Cruise',
                  description: 'Take a boat to cross the river and enjoy views of riverside temples.',
                  location: 'Chao Phraya River',
                ),
                ActivityStep(
                  time: '15:30',
                  activity: 'Wat Arun',
                  description: 'Climb the Temple of Dawn for stunning river views.',
                  location: 'Thonburi',
                ),
              ],
              accommodation: 'Hotel in Sukhumvit',
              meals: 'Breakfast at hotel, Pad Thai lunch, River cruise dinner',
            ),
            DailyItinerary(
              day: 2,
              title: 'Markets & Street Food',
              activities: [
                ActivityStep(
                  time: '07:00',
                  activity: 'Floating Market',
                  description: 'Visit Damnoen Saduak floating market, shop from boats.',
                  location: 'Ratchaburi (1.5hr from Bangkok)',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Return to Bangkok',
                  description: 'Head back to the city and rest.',
                  location: 'Bangkok',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Chatuchak Market',
                  description: 'Explore one of the world\'s largest weekend markets with 15,000 stalls.',
                  location: 'Chatuchak',
                ),
                ActivityStep(
                  time: '19:00',
                  activity: 'Khao San Road',
                  description: 'Experience the backpacker street with street food and nightlife.',
                  location: 'Khao San Road',
                ),
              ],
              accommodation: 'Hotel in Sukhumvit',
              meals: 'Breakfast at market, Lunch on the go, Street food dinner',
            ),
            DailyItinerary(
              day: 3,
              title: 'Modern Bangkok',
              activities: [
                ActivityStep(
                  time: '10:00',
                  activity: 'Jim Thompson House',
                  description: 'Tour the beautiful traditional Thai house and silk museum.',
                  location: 'Siam',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'MBK Center Shopping',
                  description: 'Shop at the massive mall for souvenirs and local goods.',
                  location: 'Pathumwan',
                ),
                ActivityStep(
                  time: '15:00',
                  activity: 'Siam Square',
                  description: 'Explore trendy boutiques and youth culture.',
                  location: 'Siam',
                ),
                ActivityStep(
                  time: '18:00',
                  activity: 'Rooftop Bar Experience',
                  description: 'Enjoy sunset drinks at a Sky Bar with panoramic city views.',
                  location: 'Silom',
                ),
              ],
              accommodation: 'Hotel in Sukhumvit',
              meals: 'Breakfast at hotel, Food court lunch, Fine dining dinner',
            ),
            DailyItinerary(
              day: 4,
              title: 'Chinatown & Departure',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Chinatown (Yaowarat)',
                  description: 'Explore the vibrant Chinese quarter with gold shops and temples.',
                  location: 'Yaowarat',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Wat Traimit',
                  description: 'See the Golden Buddha, the world\'s largest solid gold statue.',
                  location: 'Chinatown',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Last Thai Massage',
                  description: 'Enjoy a final relaxing traditional Thai massage.',
                  location: 'Sukhumvit',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Airport Transfer',
                  description: 'Take Airport Rail Link to Suvarnabhumi Airport.',
                  location: 'BKK Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Dim sum lunch, Airport food',
            ),
          ],
        ),
        CityGuide(
          id: '10',
          cityName: 'London',
          country: 'United Kingdom',
          coverImageUrl: 'https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800&q=80',
          description: 'A historic capital blending royal heritage with modern culture. World-class museums, iconic landmarks, and diverse neighborhoods.',
          rating: 4.6,
          reviewCount: 214,
          highlights: ['Big Ben', 'Tower Bridge', 'British Museum', 'Buckingham Palace'],
          travelTips: {
            'Best Time': 'May to September',
            'Currency': 'British Pound (GBP)',
            'Language': 'English',
            'Transportation': 'Underground (Tube), Bus, Walking',
          },
          bestTimeToVisit: ['May', 'June', 'July', 'August', 'September'],
          mustVisitPlaces: [
            'Tower of London',
            'British Museum',
            'Big Ben & Parliament',
            'London Eye',
            'Buckingham Palace',
            'Hyde Park',
          ],
          localFoods: [
            'Fish and Chips',
            'Full English Breakfast',
            'Afternoon Tea',
            'Pie and Mash',
            'Sunday Roast',
            'Curry',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 10)),
          isWeeklyFeatured: false,
          recommendedMonth: 'July',
          recommendedDays: 4,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Royal London',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Buckingham Palace',
                  description: 'Watch the Changing of the Guard ceremony. Tour the State Rooms if open.',
                  location: 'Westminster',
                ),
                ActivityStep(
                  time: '11:30',
                  activity: 'Westminster Abbey',
                  description: 'Visit the historic church where monarchs are crowned.',
                  location: 'Westminster',
                ),
                ActivityStep(
                  time: '13:30',
                  activity: 'Big Ben & Parliament',
                  description: 'See the iconic clock tower and Houses of Parliament.',
                  location: 'Westminster',
                ),
                ActivityStep(
                  time: '15:00',
                  activity: 'London Eye',
                  description: 'Ride the giant observation wheel for panoramic city views.',
                  location: 'South Bank',
                ),
                ActivityStep(
                  time: '17:30',
                  activity: 'South Bank Walk',
                  description: 'Stroll along the Thames, enjoy street performers.',
                  location: 'South Bank',
                ),
              ],
              accommodation: 'Hotel in Covent Garden',
              meals: 'Full English breakfast, Fish and chips lunch, Pub dinner',
            ),
            DailyItinerary(
              day: 2,
              title: 'Museums & Culture',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'British Museum',
                  description: 'Explore world history, see the Rosetta Stone and Egyptian mummies.',
                  location: 'Bloomsbury',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Covent Garden',
                  description: 'Enjoy lunch and watch street performers in the piazza.',
                  location: 'Covent Garden',
                ),
                ActivityStep(
                  time: '15:00',
                  activity: 'National Gallery',
                  description: 'View masterpieces by Van Gogh, Da Vinci, and Monet.',
                  location: 'Trafalgar Square',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Piccadilly Circus',
                  description: 'See the famous neon signs and vibrant atmosphere.',
                  location: 'West End',
                ),
                ActivityStep(
                  time: '19:30',
                  activity: 'West End Show',
                  description: 'Watch a world-class musical or play in Theatre District.',
                  location: 'West End',
                ),
              ],
              accommodation: 'Hotel in Covent Garden',
              meals: 'Breakfast at hotel, Lunch in Covent Garden, Pre-theater dinner',
            ),
            DailyItinerary(
              day: 3,
              title: 'Tower & Markets',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Tower of London',
                  description: 'See the Crown Jewels and learn about the tower\'s dark history.',
                  location: 'Tower Hill',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Tower Bridge',
                  description: 'Walk across the iconic bridge and visit the exhibition.',
                  location: 'Tower Bridge',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Borough Market',
                  description: 'Explore London\'s oldest food market with diverse cuisines.',
                  location: 'Southwark',
                ),
                ActivityStep(
                  time: '16:30',
                  activity: 'The Shard',
                  description: 'Visit the viewing platform at the tallest building in Western Europe.',
                  location: 'London Bridge',
                ),
                ActivityStep(
                  time: '19:00',
                  activity: 'Traditional Pub Experience',
                  description: 'Enjoy a pint and Sunday roast at a historic pub.',
                  location: 'City of London',
                ),
              ],
              accommodation: 'Hotel in Covent Garden',
              meals: 'Breakfast at hotel, Market food lunch, Sunday roast dinner',
            ),
            DailyItinerary(
              day: 4,
              title: 'Hyde Park & Departure',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Hyde Park',
                  description: 'Take a morning stroll, see Speakers\' Corner and Serpentine Lake.',
                  location: 'Hyde Park',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Harrods',
                  description: 'Visit the famous luxury department store for shopping.',
                  location: 'Knightsbridge',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Afternoon Tea',
                  description: 'Enjoy traditional afternoon tea with scones and sandwiches.',
                  location: 'Mayfair',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Airport Transfer',
                  description: 'Take Heathrow Express to the airport.',
                  location: 'Heathrow Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Afternoon tea, Airport food',
            ),
          ],
        ),
        CityGuide(
          id: '11',
          cityName: 'Sydney',
          country: 'Australia',
          coverImageUrl: 'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=800&q=80',
          description: 'A stunning harbor city known for iconic architecture, beautiful beaches, and outdoor lifestyle. Gateway to Australia.',
          rating: 4.7,
          reviewCount: 159,
          highlights: ['Opera House', 'Harbour Bridge', 'Bondi Beach', 'Darling Harbour'],
          travelTips: {
            'Best Time': 'September to November, March to May',
            'Currency': 'Australian Dollar (AUD)',
            'Language': 'English',
            'Transportation': 'Train, Ferry, Bus',
          },
          bestTimeToVisit: ['September', 'October', 'November', 'March', 'April', 'May'],
          mustVisitPlaces: [
            'Sydney Opera House',
            'Harbour Bridge',
            'Bondi Beach',
            'Royal Botanic Garden',
            'Darling Harbour',
            'The Rocks',
          ],
          localFoods: [
            'Meat Pie',
            'Fish and Chips',
            'Lamington',
            'Pavlova',
            'Vegemite Toast',
            'Barramundi',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 11)),
          isWeeklyFeatured: false,
          recommendedMonth: 'November',
          recommendedDays: 4,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Iconic Sydney',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Sydney Opera House',
                  description: 'Take a guided tour of the world-famous performing arts center.',
                  location: 'Bennelong Point',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Royal Botanic Garden',
                  description: 'Stroll through the beautiful gardens with Opera House views.',
                  location: 'CBD',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'The Rocks',
                  description: 'Explore Sydney\'s historic neighborhood with weekend markets.',
                  location: 'The Rocks',
                ),
                ActivityStep(
                  time: '15:00',
                  activity: 'Harbour Bridge Climb',
                  description: 'Climb the iconic bridge for panoramic harbor views.',
                  location: 'Harbour Bridge',
                ),
                ActivityStep(
                  time: '18:30',
                  activity: 'Circular Quay Dinner',
                  description: 'Enjoy waterfront dining with views of Opera House lit up.',
                  location: 'Circular Quay',
                ),
              ],
              accommodation: 'Hotel in CBD',
              meals: 'Breakfast at hotel, Lunch at The Rocks, Harbor dinner',
            ),
            DailyItinerary(
              day: 2,
              title: 'Beaches & Coastal Walk',
              activities: [
                ActivityStep(
                  time: '08:00',
                  activity: 'Bondi Beach',
                  description: 'Start the day at Australia\'s most famous beach. Try surfing or swim.',
                  location: 'Bondi',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Bondi to Coogee Coastal Walk',
                  description: 'Walk the stunning 6km clifftop path passing beaches and parks.',
                  location: 'Eastern Suburbs',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Coogee Beach',
                  description: 'Relax at Coogee, swim in the ocean pool.',
                  location: 'Coogee',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Return to CBD',
                  description: 'Head back to the city via bus.',
                  location: 'Sydney CBD',
                ),
                ActivityStep(
                  time: '19:00',
                  activity: 'Darling Harbour',
                  description: 'Evening entertainment district with restaurants and waterfront.',
                  location: 'Darling Harbour',
                ),
              ],
              accommodation: 'Hotel in CBD',
              meals: 'Breakfast at cafe, Fish and chips lunch, Seafood dinner',
            ),
            DailyItinerary(
              day: 3,
              title: 'Wildlife & Culture',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Taronga Zoo',
                  description: 'Take ferry to the zoo, see Australian native animals with harbor views.',
                  location: 'Mosman',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Manly Beach Ferry',
                  description: 'Take the scenic ferry ride to Manly Beach.',
                  location: 'Manly',
                ),
                ActivityStep(
                  time: '15:30',
                  activity: 'Manly Beach',
                  description: 'Enjoy the beach atmosphere, walk the promenade.',
                  location: 'Manly',
                ),
                ActivityStep(
                  time: '18:00',
                  activity: 'Sunset Ferry Back',
                  description: 'Return to Circular Quay enjoying the sunset views.',
                  location: 'Ferry',
                ),
              ],
              accommodation: 'Hotel in CBD',
              meals: 'Breakfast at hotel, Zoo lunch, Dinner at Manly',
            ),
            DailyItinerary(
              day: 4,
              title: 'Shopping & Departure',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Queen Victoria Building',
                  description: 'Shop at the beautiful historic shopping center.',
                  location: 'CBD',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Sydney Tower Eye',
                  description: 'Visit the observation deck for 360-degree city views.',
                  location: 'CBD',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Final Aussie Lunch',
                  description: 'Enjoy meat pies or lamingtons before departure.',
                  location: 'CBD',
                ),
                ActivityStep(
                  time: '15:30',
                  activity: 'Airport Train',
                  description: 'Take the train to Sydney Kingsford Smith Airport.',
                  location: 'SYD Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Aussie lunch, Airport snacks',
            ),
          ],
        ),
        CityGuide(
          id: '12',
          cityName: 'Istanbul',
          country: 'Turkey',
          coverImageUrl: 'https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800&q=80',
          description: 'A transcontinental city bridging Europe and Asia. Rich in history, culture, bazaars, and stunning architecture.',
          rating: 4.6,
          reviewCount: 182,
          highlights: ['Hagia Sophia', 'Blue Mosque', 'Grand Bazaar', 'Bosphorus'],
          travelTips: {
            'Best Time': 'April to May, September to November',
            'Currency': 'Turkish Lira (TRY)',
            'Language': 'Turkish, English in tourist areas',
            'Transportation': 'Tram, Metro, Ferry, Taxi',
          },
          bestTimeToVisit: ['April', 'May', 'September', 'October', 'November'],
          mustVisitPlaces: [
            'Hagia Sophia',
            'Blue Mosque',
            'Topkapi Palace',
            'Grand Bazaar',
            'Bosphorus Cruise',
            'Galata Tower',
          ],
          localFoods: [
            'Kebab',
            'Baklava',
            'Turkish Delight',
            'Börek',
            'Simit',
            'Turkish Tea',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 12)),
          isWeeklyFeatured: false,
          recommendedMonth: 'April',
          recommendedDays: 4,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Sultanahmet Historic Area',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Hagia Sophia',
                  description: 'Visit the magnificent Byzantine cathedral turned mosque, marvel at the dome.',
                  location: 'Sultanahmet',
                ),
                ActivityStep(
                  time: '11:30',
                  activity: 'Blue Mosque',
                  description: 'See the stunning interior with blue İznik tiles. Remember to dress modestly.',
                  location: 'Sultanahmet',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Hippodrome',
                  description: 'Walk through the ancient Byzantine chariot racing stadium.',
                  location: 'Sultanahmet',
                ),
                ActivityStep(
                  time: '14:30',
                  activity: 'Topkapi Palace',
                  description: 'Tour the opulent Ottoman palace with stunning Bosphorus views.',
                  location: 'Sultanahmet',
                ),
              ],
              accommodation: 'Hotel in Sultanahmet',
              meals: 'Breakfast at hotel, Kebab lunch, Traditional dinner',
            ),
            DailyItinerary(
              day: 2,
              title: 'Bazaars & Bosphorus',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Grand Bazaar',
                  description: 'Explore one of the world\'s oldest covered markets with 4,000 shops.',
                  location: 'Fatih',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Spice Bazaar',
                  description: 'Visit the Egyptian Bazaar, smell exotic spices and buy Turkish delight.',
                  location: 'Eminönü',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Bosphorus Cruise',
                  description: 'Take a ferry cruise between Europe and Asia, see palaces and bridges.',
                  location: 'Bosphorus',
                ),
                ActivityStep(
                  time: '17:30',
                  activity: 'Galata Tower',
                  description: 'Climb the medieval tower for 360-degree city views at sunset.',
                  location: 'Galata',
                ),
              ],
              accommodation: 'Hotel in Sultanahmet',
              meals: 'Breakfast at hotel, Street food lunch, Dinner in Galata',
            ),
            DailyItinerary(
              day: 3,
              title: 'Asian Side & Modern Istanbul',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Dolmabahçe Palace',
                  description: 'Visit the lavish 19th-century palace on the European shore.',
                  location: 'Beşiktaş',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Ferry to Asian Side',
                  description: 'Cross to the Asian side of Istanbul.',
                  location: 'Kadıköy',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Kadıköy Market',
                  description: 'Explore the local food market and trendy cafes.',
                  location: 'Kadıköy',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Maiden\'s Tower',
                  description: 'Visit the small tower on an islet in the Bosphorus.',
                  location: 'Üsküdar',
                ),
                ActivityStep(
                  time: '19:00',
                  activity: 'Istiklal Street',
                  description: 'Walk the famous pedestrian avenue with shops and restaurants.',
                  location: 'Beyoğlu',
                ),
              ],
              accommodation: 'Hotel in Sultanahmet',
              meals: 'Breakfast at hotel, Asian side lunch, Istiklal dinner',
            ),
            DailyItinerary(
              day: 4,
              title: 'Basilica Cistern & Departure',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Basilica Cistern',
                  description: 'Explore the ancient underground water reservoir with Medusa heads.',
                  location: 'Sultanahmet',
                ),
                ActivityStep(
                  time: '11:00',
                  activity: 'Last Bazaar Shopping',
                  description: 'Final souvenir shopping at Grand Bazaar or local shops.',
                  location: 'Sultanahmet',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Final Turkish Lunch',
                  description: 'Enjoy köfte, baklava, and Turkish tea one last time.',
                  location: 'Sultanahmet',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Airport Transfer',
                  description: 'Take airport bus or metro to Istanbul Airport.',
                  location: 'IST Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Turkish lunch, Airport food',
            ),
          ],
        ),
        CityGuide(
          id: '13',
          cityName: 'Singapore',
          country: 'Singapore',
          coverImageUrl: 'https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800&q=80',
          description: 'A futuristic city-state with lush gardens, diverse cuisine, and world-class attractions. Where tradition meets innovation.',
          rating: 4.8,
          reviewCount: 147,
          highlights: ['Marina Bay Sands', 'Gardens by the Bay', 'Sentosa', 'Hawker Centers'],
          travelTips: {
            'Best Time': 'February to April',
            'Currency': 'Singapore Dollar (SGD)',
            'Language': 'English, Mandarin, Malay, Tamil',
            'Transportation': 'MRT, Bus, Taxi',
          },
          bestTimeToVisit: ['February', 'March', 'April'],
          mustVisitPlaces: [
            'Marina Bay Sands',
            'Gardens by the Bay',
            'Sentosa Island',
            'Chinatown',
            'Little India',
            'Universal Studios',
          ],
          localFoods: [
            'Hainanese Chicken Rice',
            'Laksa',
            'Chili Crab',
            'Satay',
            'Roti Prata',
            'Kaya Toast',
          ],
          updatedAt: DateTime.now().subtract(const Duration(days: 13)),
          isWeeklyFeatured: false,
          recommendedMonth: 'March',
          recommendedDays: 4,
          dailyItinerary: [
            DailyItinerary(
              day: 1,
              title: 'Marina Bay & Gardens',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Gardens by the Bay',
                  description: 'Explore the futuristic Supertree Grove and Cloud Forest dome.',
                  location: 'Marina Bay',
                ),
                ActivityStep(
                  time: '12:00',
                  activity: 'Marina Bay Sands',
                  description: 'Visit the SkyPark observation deck for stunning city views.',
                  location: 'Marina Bay',
                ),
                ActivityStep(
                  time: '14:30',
                  activity: 'Merlion Park',
                  description: 'See Singapore\'s iconic Merlion statue and take photos.',
                  location: 'Downtown Core',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Singapore Flyer',
                  description: 'Ride the giant observation wheel for panoramic views.',
                  location: 'Marina Centre',
                ),
                ActivityStep(
                  time: '19:30',
                  activity: 'Gardens Light Show',
                  description: 'Watch the spectacular Supertree light and sound show.',
                  location: 'Gardens by the Bay',
                ),
              ],
              accommodation: 'Hotel in Marina Bay',
              meals: 'Breakfast at hotel, Hawker center lunch, Bay area dinner',
            ),
            DailyItinerary(
              day: 2,
              title: 'Sentosa Island',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Universal Studios',
                  description: 'Spend the day at Southeast Asia\'s only Universal Studios theme park.',
                  location: 'Sentosa Island',
                ),
                ActivityStep(
                  time: '15:00',
                  activity: 'S.E.A. Aquarium',
                  description: 'Visit one of the world\'s largest aquariums with 100,000 marine animals.',
                  location: 'Sentosa Island',
                ),
                ActivityStep(
                  time: '17:30',
                  activity: 'Siloso Beach',
                  description: 'Relax on the sandy beach and watch the sunset.',
                  location: 'Sentosa',
                ),
                ActivityStep(
                  time: '20:00',
                  activity: 'Wings of Time Show',
                  description: 'Watch the outdoor night show with water, lasers, and fire.',
                  location: 'Sentosa',
                ),
              ],
              accommodation: 'Hotel in Marina Bay',
              meals: 'Breakfast at hotel, Theme park food, Beach dinner',
            ),
            DailyItinerary(
              day: 3,
              title: 'Cultural Neighborhoods',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Chinatown',
                  description: 'Explore the historic neighborhood, visit Buddha Tooth Relic Temple.',
                  location: 'Chinatown',
                ),
                ActivityStep(
                  time: '11:30',
                  activity: 'Little India',
                  description: 'Walk through the colorful streets, visit Sri Veeramakaliamman Temple.',
                  location: 'Little India',
                ),
                ActivityStep(
                  time: '14:00',
                  activity: 'Kampong Glam',
                  description: 'Visit the Malay-Arab quarter, see Sultan Mosque and Haji Lane.',
                  location: 'Kampong Glam',
                ),
                ActivityStep(
                  time: '17:00',
                  activity: 'Orchard Road',
                  description: 'Shop along Singapore\'s famous retail boulevard.',
                  location: 'Orchard',
                ),
                ActivityStep(
                  time: '19:00',
                  activity: 'Clarke Quay',
                  description: 'Enjoy riverside dining and nightlife at the historic quay.',
                  location: 'Singapore River',
                ),
              ],
              accommodation: 'Hotel in Marina Bay',
              meals: 'Breakfast at hotel, Indian lunch, Chili crab dinner',
            ),
            DailyItinerary(
              day: 4,
              title: 'Shopping & Departure',
              activities: [
                ActivityStep(
                  time: '09:00',
                  activity: 'Singapore Zoo',
                  description: 'Visit the world-renowned open-concept zoo (if time permits).',
                  location: 'Mandai',
                ),
                ActivityStep(
                  time: '13:00',
                  activity: 'Jewel Changi Airport',
                  description: 'Visit the stunning airport with indoor waterfall and gardens.',
                  location: 'Changi Airport',
                ),
                ActivityStep(
                  time: '14:30',
                  activity: 'Last Hawker Center',
                  description: 'Enjoy one final meal of Hainanese chicken rice or laksa.',
                  location: 'Airport',
                ),
                ActivityStep(
                  time: '16:00',
                  activity: 'Check-in for Flight',
                  description: 'Head to your departure gate.',
                  location: 'Changi Airport',
                ),
              ],
              accommodation: 'N/A',
              meals: 'Breakfast at hotel, Hawker center lunch, Airport snacks',
            ),
          ],
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final weeklyFeatured = _cityGuides.where((guide) => guide.isWeeklyFeatured).toList();
    final otherCities = _cityGuides.where((guide) => !guide.isWeeklyFeatured).toList();

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (weeklyFeatured.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Weekly Featured',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: weeklyFeatured.length,
                    itemBuilder: (context, index) {
                      final guide = weeklyFeatured[index];
                      return _buildCityCard(guide, context);
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Monthly Recommendations',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherCities.length,
                itemBuilder: (context, index) {
                  final guide = otherCities[index];
                  return _buildCityListItem(guide, context);
                },
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }

  Widget _buildCityCard(CityGuide guide, BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CityDetailScreen(cityGuide: guide),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    guide.coverImageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 150,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 50),
                      );
                    },
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Weekly',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.fullLocation,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${guide.rating}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${guide.reviewCount})',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      guide.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityListItem(CityGuide guide, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CityDetailScreen(cityGuide: guide),
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.network(
                guide.coverImageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.fullLocation,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${guide.rating}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${guide.reviewCount})',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      guide.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

