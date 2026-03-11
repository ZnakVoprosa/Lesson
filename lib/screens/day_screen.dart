import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule_provider.dart';

class DayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<ScheduleProvider>();
    return PageView.builder(
      itemCount: 5, // пн—пт
      itemBuilder: (ctx, index) {
        final day = index + 1;
        final dayLessons = prov.lessons.where((l) => l.dayOfWeek == day && (l.weekType == 0 || l.weekType == prov.currentWeek));
        return ListView.builder(
          itemCount: dayLessons.length,
          itemBuilder: (ctx, idx) => ListTile(
            title: Text(dayLessons.elementAt(idx).title),
            subtitle: Text(dayLessons.elementAt(idx).room),
          ),
        );
      },
    );
  }
}