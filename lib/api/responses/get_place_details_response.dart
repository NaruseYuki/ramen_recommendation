import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/review.dart';

part 'get_place_details_response.freezed.dart';
part 'get_place_details_response.g.dart';

@freezed
abstract class GetPlaceDetailsResponse with _$GetPlaceDetailsResponse {
  const factory GetPlaceDetailsResponse({
    required String id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
    double? rating,
    int? userRatingsTotal,
    String? website,
    required List<Review> reviews,
    required List<String> weekdayDescriptions,
    required bool openNow,
    List<Photo>? photos,
  }) = _GetPlaceDetailsResponse;

  factory GetPlaceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetPlaceDetailsResponse.fromNestedJson(json);

  factory GetPlaceDetailsResponse.fromNestedJson(Map<String, dynamic> json) {
    final location = json['location'] ?? {};
    final displayName = json['displayName'] as Map<String, dynamic>?;

    return GetPlaceDetailsResponse(
      id: json['id'] ?? '',
      name: displayName?['text'] ?? '名称不明',
      address: json['formattedAddress'] ?? '住所不明',
      latitude: location['latitude'] ?? 0.0,
      longitude: location['longitude'] ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble(),
      userRatingsTotal: json['userRatingCount'] as int?,
      website: json['websiteUri'] as String?,
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((review) => Review.fromJson(review as Map<String, dynamic>))
          .toList(),
      weekdayDescriptions: List<String>.from(
        json['currentOpeningHours']?['weekdayDescriptions'] ?? [],
      ),
      openNow: json['currentOpeningHours']?['openNow'] ?? false,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
