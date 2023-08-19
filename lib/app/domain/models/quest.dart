class Quest {
  final String title;
  final String description;
  final QuestStatus status;
  final int difficulty;
  final int reward;

  const Quest({
    required this.title,
    required this.description,
    required this.status,
    required this.difficulty,
    required this.reward,
  });
}

enum QuestStatus {
  newly('NEW!'),
  inProgress('IN PROGRESS'),
  done('DONE!');

  final String text;
  const QuestStatus(this.text);
}