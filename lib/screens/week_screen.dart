import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule_provider.dart';

class WeekScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<ScheduleProvider>();
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (ctx, dayIndex) {
        final day = dayIndex + 1;
        final dayLessons = prov.lessons.where((l) => l.dayOfWeek == day && (l.weekType == 0 || l.weekType == prov.currentWeek));
        return ExpansionTile(
          title: Text('День $day'),
          children: dayLessons.map((e) => ListTile(title: Text(e.title))).toList(),
        );
      },
    );
  }
}