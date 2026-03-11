class BellTime {
  final String start;
  final String end;

  BellTime({required this.start, required this.end});
  Map<String, dynamic> toJson() => {'s': start, 'e': end};
  factory BellTime.fromJson(Map<String, dynamic> json) => BellTime(start: json['s'], end: json['e']);
}