import 'dart:convert';

class BellTime {
  final String start, end;
  BellTime({required this.start, required this.end});

  Map<String, dynamic> toJson() => {'start': start, 'end': end};
  factory BellTime.fromJson(Map<String, dynamic> json) => BellTime(start: json['start'], end: json['end']);
}

class WeekBell {
  final List<BellTime> monday; // ساخته شده توسط شما
  final List<BellTime> tuesday;
  final List<BellTime> wednesday;
  final List<BellTime> thursday;
  final List<BellTime> friday;

  WeekBell({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
  });

  Map<String, dynamic> toJson() => {
    'Mon': monday.map((e) => e.toJson()).toList(),
    'Tue': tuesday.map((e) => e.toJson()).toList(),
    'Wed': wednesday.map((e) => e.toJson()).toList(),
    'Thu': thursday.map((e) => e.toJson()).toList(),
    'Fri': friday.map((e) => e.toJson()).toList(),
  };

  factory WeekBell.fromJson(Map<String, dynamic> json) => WeekBell(
    monday: (json['Mon'] as List).map((e) => BellTime.fromJson(e)).toList(),
    tuesday: (json['Tue'] as List).map((e) => BellTime.fromJson(e)).toList(),
    wednesday: (json['Wed'] as List).map((e) => BellTime.fromJson(e)).toList(),
    thursday: (json['Thu'] as List).map((e) => BellTime.fromJson(e)).toList(),
    friday: (json['Fri'] as List).map((e) => BellTime.fromJson(e)).toList(),
  );
}