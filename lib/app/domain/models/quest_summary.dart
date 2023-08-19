class QuestSummary {
  final String id;
  final String thumbnailUrl;
  final String title;
  final String shortDescription;
  final int difficulty;
  final DateTime createdAt;

  const QuestSummary({
    required this.id,
    required this.thumbnailUrl,
    required this.title,
    required this.shortDescription,
    required this.difficulty,
    required this.createdAt,
  });

  factory QuestSummary.fromMap(Map<String, dynamic> map) {
    return QuestSummary(
      id: map['id'].toString(),
      thumbnailUrl: map['thumbnailUrl'] as String,
      title: map['title'] as String,
      shortDescription: map['shortDescription'] as String,
      difficulty: map['difficulty'] as int,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
