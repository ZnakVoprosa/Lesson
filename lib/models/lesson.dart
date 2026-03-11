class Lesson {
  final String title, type, room, time, teacher, items;
  final int dayOfWeek, weekType;

  Lesson({required this.title, required this.type, required this.room, required this.time, 
          required this.teacher, required this.items, required this.dayOfWeek, required this.weekType});

  Map<String, dynamic> toJson() => {'t': title, 'ty': type, 'r': room, 'ti': time, 'te': teacher, 'i': items, 'd': dayOfWeek, 'w': weekType};
  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    title: json['t'], type: json['ty'], room: json['r'], time: json['ti'], 
    teacher: json['te'], items: json['i'], dayOfWeek: json['d'], weekType: json['w']);
}