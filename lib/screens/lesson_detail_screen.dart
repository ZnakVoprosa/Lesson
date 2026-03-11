class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;
  LessonDetailScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Тип: ${lesson.type}", style: TextStyle(fontSize: 18)),
            Text("Аудитория: ${lesson.room}"),
            Text("Время: ${lesson.timeOrNumber}"),
            if (lesson.teacher!.isNotEmpty) Text("Преподаватель: ${lesson.teacher}"),
            if (lesson.items!.isNotEmpty) Divider(),
            if (lesson.items!.isNotEmpty) Text("С собой: ${lesson.items}", style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}