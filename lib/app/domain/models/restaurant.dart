class RestaurantMenu {
  final String id;
  final String name;
  final String thumnailUrl;
  final int price;
  final String restaurantId;

  const RestaurantMenu({
    required this.id,
    required this.name,
    required this.thumnailUrl,
    required this.price,
    required this.restaurantId,
  });

  factory RestaurantMenu.fromMap(Map<String, dynamic> map) {
    return RestaurantMenu(
      id: map['id'].toString(),
      name: map['name'] as String,
      thumnailUrl: map['thumnailUrl'] as String,
      price: map['price'] as int,
      restaurantId: map['restaurantId'].toString(),
    );
  }
}

class Restaurant {
  final String id;
  final String name;
  final String thumbnailUrl;
  final double rating;
  final double latitude;
  final double longitude;
  final String kakaoMapId;
  final String naverMapId;
  final bool available;
  final List<RestaurantMenu> menus;
  final String editorComment;
  final int originalPrice;
  final int discountPrice;
  final String mapImageUrl;

  const Restaurant({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.editorComment,
    required this.originalPrice,
    required this.discountPrice,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.kakaoMapId,
    required this.naverMapId,
    required this.available,
    required this.menus,
    required this.mapImageUrl,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'].toString(),
      name: map['name'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      editorComment: map['editorComment'] as String,
      originalPrice: map['originalPrice'] as int,
      discountPrice: map['discountPrice'] as int,
      rating: map['rating'] as double,
      latitude: map['latitude'].toDouble(),
      longitude: map['longitude'].toDouble(),
      kakaoMapId: map['kakaoMapId'] as String,
      naverMapId: map['naverMapId'] as String,
      available: map['available'] as bool,
      menus: map['menus']
          .map<RestaurantMenu>((e) => RestaurantMenu.fromMap(e))
          .toList(),
      mapImageUrl: map['mapImageUrl'] as String,
    );
  }
}
