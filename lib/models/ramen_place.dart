class RamenPlace {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  RamenPlace({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  /// JSON から `RamenPlace` を生成
  factory RamenPlace.fromJson(Map<String, dynamic> json) {
    final location = json['location'] ?? {};
    return RamenPlace(
      id: json['id'] ?? '',
      name: json['displayName']['text'] ?? '名称不明',
      address: json['formattedAddress'] ?? '住所不明',
      latitude: location['latitude'] ?? 0.0,
      longitude: location['longitude'] ?? 0.0,
    );
  }

  /// `RamenPlace` を JSON に変換
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
