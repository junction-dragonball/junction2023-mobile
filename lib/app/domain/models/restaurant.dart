class Restaurant {
  final String id;
  final String name;
  final String thumbnailUrl;
  final double rating;
  // final double latitude;
  // final double longitude;
  // final String kakaoMapId;
  // final bool available;

  const Restaurant({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.rating,
    // required this.latitude,
    // required this.longitude,
    // required this.kakaoMapId,
    // required this.available,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'].toString(),
      name: map['title'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      rating: map['rating'] as double,
      // latitude: map['latitiude'] as double,
      // longitude: map['longitude'] as double,
      // kakaoMapId: map['kakaoMapId'] as String,
      // available: map['available'] as bool,
    );
  }
}
