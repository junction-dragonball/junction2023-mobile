class User {
  final String id;
  final String deviceId;
  final String name;
  final int points;

  const User({
    required this.id,
    required this.deviceId,
    required this.name,
    required this.points,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'].toString(),
      deviceId: map['deviceId'] as String,
      name: map['name'] as String,
      points: map['points'] as int,
    );
  }
}
