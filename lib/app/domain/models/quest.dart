class Quest {
  final String id;
  final String title;
  final String thumbnailUrl;
  final int difficulty;
  final String shortDescription;
  final String description;
  final int period;
  final String verifyMethod;
  final String instruction;
  final int reward;
  final bool available;
  final DateTime createdAt;

  const Quest({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.difficulty,
    required this.shortDescription,
    required this.description,
    required this.period,
    required this.verifyMethod,
    required this.instruction,
    required this.reward,
    required this.available,
    required this.createdAt,
  });

  factory Quest.fromMap(Map<String, dynamic> map) {
    return Quest(
      id: map['id'].toString(),
      title: map['title'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      difficulty: map['difficulty'] as int,
      shortDescription: map['shortDescription'] as String,
      description: map['description'] as String,
      period: map['period'] as int,
      verifyMethod: map['verifyMethod'] as String,
      instruction: map['instruction'] as String,
      reward: map['reward'] as int,
      available: map['available'] as bool,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
