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

  /// `Review` を JSON に変換
  Map<String, dynamic> toJson() {
    return {
      'authorName': authorName,
      'text': text,
      'rating': rating,
      'authorPhotoUri': authorPhotoUri,
      'authorUri': authorUri,
    };
  }
}
