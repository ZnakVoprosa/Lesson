import 'dart:convert';

class Lesson {
  final String id, title, type, room, time, teacher, items;
  final int dayOfWeek;
  final int weekType;

  Lesson({
    required this.id,
    required this.title,
    required this.type,
    required this.room,
    required this.time,
    required this.teacher,
    required this.items,
    required this.dayOfWeek,
    required this.weekType,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'type': type,
    'room': room,
    'time': time,
    'teacher': teacher,
    'items': items,
    'dayOfWeek': dayOfWeek,
    'weekType': weekType,
  };

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json['id'],
    title: json['title'],
    type: json['type'],
    room: json['room'],
    time: json['time'],
    teacher: json['teacher'],
    items: json['items'],
    dayOfWeek: json['dayOfWeek'],
    weekType: json['weekType'],
  );
}