import 'package:intl/intl.dart';

class Quest {
  final String id;
  final String title;
  final String thumbnailUrl;
  final int difficulty;
  final String shortDescription;
  final String description;
  final int period;
  final VerifyMethod verifyMethod;
  final String instruction;
  final int reward;
  final bool available;
  final DateTime createdAt;

  bool get isNew => id == '1';

  bool get isAd => title.startsWith('(Ad)');

  String get durationStr {
    DateTime createdAt = DateTime.now(); // 현재 날짜와 시간을 가져옵니다.
    int duration = 6; // 6일의 기간을 정의합니다.

    // 오늘부터 시작해서 지정된 기간만큼 후의 날짜를 계산합니다.
    DateTime startDate = DateTime.now();
    DateTime endDate = createdAt.add(Duration(days: duration));

    // 날짜를 원하는 형식의 문자열로 변환합니다.
    String formattedStartDate = DateFormat('MMM d').format(startDate);
    String formattedEndDate = DateFormat('MMM d').format(endDate);

    // 최종적으로 원하는 문자열을 만들어 출력합니다.
    return 'From Today, it will be $formattedStartDate - $formattedEndDate.';
  }

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
      verifyMethod: verifyMethodMapper[map['verifyMethod'] as String] as VerifyMethod,
      instruction: map['instruction'] as String,
      reward: map['reward'] as int,
      available: map['available'] as bool,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

enum VerifyMethod {
  location('Location', 'If you open the app, when you go to the specified location for the quest, it will be achieved!'),
  uploadPhoto('Upload Photo', 'Our AI will analyze your photo and automatically check whether you have completed the quest.'),
  autoDetection('Auto Detection', 'Yummy Quest app will automatically detect whether you have completed the quest.'),
  time('Time', 'When the quest timer ends, it will be achieved! Be careful not to stop the timer.');

  // TODO: iconPath 추가?
  final String title;
  final String content;

  const VerifyMethod(this.title, this.content);
}

const Map<String, VerifyMethod> verifyMethodMapper = {
  'Location verification': VerifyMethod.location,
  'photo verification': VerifyMethod.uploadPhoto,
  'auto verification': VerifyMethod.autoDetection,
  'Time verification': VerifyMethod.time,
};

