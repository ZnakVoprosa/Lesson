import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule_provider.dart';

class DayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ScheduleProvider>(context);
    return PageView.builder(
      itemCount: 7,
      itemBuilder: (ctx, i) {
        final list = prov.lessons.where((l) => l.dayOfWeek == i + 1 && (l.weekType == 0 || l.weekType == prov.currentViewWeek)).toList();
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (ctx, idx) => ListTile(title: Text(list[idx].title), subtitle: Text(list[idx].time)),
        );
      },
    );
  }
}