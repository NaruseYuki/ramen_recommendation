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
    final reviewsJson = json['reviews'] as List<dynamic>? ?? [];
    final reviews =
        reviewsJson.map((review) => Review.fromJson(review)).toList();

    return GetPlaceDetailsResponse(
      id: json['id'] ?? '',
      name: json['displayName']['text'] ?? '名称不明',
      address: json['formattedAddress'] ?? '住所不明',
      latitude: location['latitude'] ?? 0.0,
      longitude: location['longitude'] ?? 0.0,
      rating: json['rating']?.toDouble(),
      userRatingsTotal: json['userRatingCount'],
      website: json['websiteUri'],
      reviews: reviews,
      weekdayDescriptions: List<String>.from(
          json['currentOpeningHours']['weekdayDescriptions'] ?? []),
      openNow: json['currentOpeningHours']['openNow'] ?? false,
    );
  }
}

class Review {
  final String authorName;
  final String text;
  final double? rating;
  final String? authorPhotoUri;
  final String? authorUri;

  Review({
    required this.authorName,
    required this.text,
    this.rating,
    this.authorPhotoUri,
    this.authorUri,
  });

  /// JSON から `Review` を生成
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      authorName: json['authorAttribution']['displayName'] ?? '名無し',
      text: json['originalText']['text'] ?? '口コミなし',
      rating: json['rating']?.toDouble(),
      authorPhotoUri: json['authorAttribution']['photoUri'],
      authorUri: json['authorAttribution']['uri'],
    );
  }
}
