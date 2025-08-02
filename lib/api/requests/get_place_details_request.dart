class GetPlaceDetailsRequest {
  final String placeId;
  final String languageCode;
  final String fields;

  GetPlaceDetailsRequest({
    required this.placeId,
    this.languageCode = 'ja',
    this.fields = 'id,displayName,'
        'formattedAddress,'
        'currentOpeningHours,'
        'rating,userRatingCount,'
        'websiteUri,reviews,location,photos',
  });

  Map<String, String> toQueryParams() {
    return {
      'languageCode': languageCode,
      'fields': fields,
    };
  }
}
