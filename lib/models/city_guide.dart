class DailyItinerary {
  final int day;
  final String title;
  final List<ActivityStep> activities;
  final String accommodation;
  final String meals;

  DailyItinerary({
    required this.day,
    required this.title,
    required this.activities,
    required this.accommodation,
    required this.meals,
  });
}

class ActivityStep {
  final String time;
  final String activity;
  final String description;
  final String location;

  ActivityStep({
    required this.time,
    required this.activity,
    required this.description,
    required this.location,
  });
}

class CityGuide {
  final String id;
  final String cityName;
  final String country;
  final String coverImageUrl;
  final String description;
  final double rating;
  final int reviewCount;
  final List<String> highlights;
  final Map<String, String> travelTips;
  final List<String> bestTimeToVisit;
  final List<String> mustVisitPlaces;
  final List<String> localFoods;
  final DateTime updatedAt;
  final bool isWeeklyFeatured;
  final String? recommendedMonth;
  final int? recommendedDays;
  final List<DailyItinerary>? dailyItinerary;

  CityGuide({
    required this.id,
    required this.cityName,
    required this.country,
    required this.coverImageUrl,
    required this.description,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.highlights = const [],
    this.travelTips = const {},
    this.bestTimeToVisit = const [],
    this.mustVisitPlaces = const [],
    this.localFoods = const [],
    required this.updatedAt,
    this.isWeeklyFeatured = false,
    this.recommendedMonth,
    this.recommendedDays,
    this.dailyItinerary,
  });

  String get fullLocation => '$cityName, $country';
}
