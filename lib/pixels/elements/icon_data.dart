part of 'icon.dart';

// User UPPER_CASE to avoid keywords
// ignore_for_file: constant_identifier_names

enum IconName {
  ADD_PHOTO,
  BOARD,
  CHECK,
  DESTINATION,
  DONE,
  FLAG,
  GIFT,
  HOME,
  LOCATION,
  MARKET,
  MOBILE,
  PERIOD,
  PREV,
  SHARE,
  STAR,
  TAG,
  TIME,
  USER,
}

extension IconNameExtension on IconName {
  String get str {
    return name.toLowerCase().replaceAll('_', '-');
  }
}

class IconMap {
  static const Map<String, List<int>> _data = {
    'add-photo': [57344, 58385, 59378, 57595],
    'board': [58777, 61167, 57351],
    'check': [58788, 61009, 57353],
    'destination': [57344, 58708, 59836, 57587],
    'done': [58099, 58243],
    'flag': [58112, 61293],
    'gift': [58119, 59697],
    'home': [58128, 58592],
    'location': [59157, 61344, 57526],
    'market': [57344, 58376, 58220, 57541],
    'mobile': [57344, 58364, 58736, 57439],
    'period': [57344, 58290, 60555, 57408],
    'prev': [58187, 57908],
    'share': [59014, 58622, 57360],
    'star': [58209, 58963],
    'tag': [57792, 57499],
    'time': [58214, 58062],
    'user': [58223, 60364],
  };

  static List<int> get(String key) {
    return _data[key]!;
  }
}
