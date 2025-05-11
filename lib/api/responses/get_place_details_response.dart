import 'package:ramen_recommendation/models/review.dart';

class GetPlaceDetailsResponse {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double? rating;
  final int? userRatingsTotal;
  final String? website;
  final List<Review> reviews;
  final List<String> weekdayDescriptions;
  final bool openNow;

  GetPlaceDetailsResponse({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.rating,
    this.userRatingsTotal,
    this.website,
    required this.reviews,
    required this.weekdayDescriptions,
    required this.openNow,
  });

  /// JSON から `GetPlaceDetailsResponse` を生成
  factory GetPlaceDetailsResponse.fromJson(Map<String, dynamic> json) {
    final location = json['location'] ?? {};

    return GetPlaceDetailsResponse(
      id: json['id'] ?? '',
      name: json['displayName']['text'] ?? '名称不明',
      address: json['formattedAddress'] ?? '住所不明',
      latitude: location['latitude'] ?? 0.0,
      longitude: location['longitude'] ?? 0.0,
      rating: json['rating']?.toDouble(),
      userRatingsTotal: json['userRatingCount'],
      website: json['websiteUri'],
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((review) => Review.fromJson(review))
          .toList(),
      weekdayDescriptions: List<String>.from(
          json['currentOpeningHours']['weekdayDescriptions'] ?? []),
      openNow: json['currentOpeningHours']['openNow'] ?? false,
    );
  }
}
