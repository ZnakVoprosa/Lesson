import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule_provider.dart';

class WeekScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScheduleProvider>(context);
    return Column(
      children: [
        SwitchListTile(
          title: Text("Неделя: ${provider.currentViewWeek == 1 ? 'Верхняя' : 'Нижняя'}"),
          value: provider.currentViewWeek == 2,
          onChanged: (_) => provider.toggleWeek(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (ctx, i) => ListTile(
              title: Text("День ${i + 1}"),
              subtitle: Text("${provider.getLessonsForDay(i + 1).length} пар(ы)"),
            ),
          ),
        ),
      ],
    );
  }
}