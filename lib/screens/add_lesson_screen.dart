import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/lesson.dart';
import '../providers/schedule_provider.dart';

class AddLessonScreen extends StatefulWidget {
  @override
  _AddLessonScreenState createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = {
    'title': TextEditingController(),
    'room': TextEditingController(),
    'time': TextEditingController(),
    'teacher': TextEditingController(),
    'items': TextEditingController(),
  };
  String _selectedType = 'Лекция';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Добавить пару")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(controller: _controllers['title'], decoration: InputDecoration(labelText: 'Название урока'), validator: (v) => v!.isEmpty ? 'Введите название' : null),
            DropdownButtonFormField(
              value: _selectedType,
              items: ['Лекция', 'Семинар', 'Лабораторная'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _selectedType = v!),
            ),
            TextFormField(controller: _controllers['room'], decoration: InputDecoration(labelText: 'Аудитория'), validator: (v) => v!.isEmpty ? 'Укажите аудиторию' : null),
            TextFormField(controller: _controllers['time'], decoration: InputDecoration(labelText: 'Время/Номер пары'), validator: (v) => v!.isEmpty ? 'Укажите время' : null),
            TextFormField(controller: _controllers['teacher'], decoration: InputDecoration(labelText: 'ФИО преподавателя (опц.)')),
            TextFormField(controller: _controllers['items'], decoration: InputDecoration(labelText: 'Вещи с собой (опц.)')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newLesson = Lesson(
                    title: _controllers['title']!.text,
                    type: _selectedType,
                    room: _controllers['room']!.text,
                    timeOrNumber: _controllers['time']!.text,
                    teacher: _controllers['teacher']!.text,
                    items: _controllers['items']!.text,
                  );
                  Provider.of<ScheduleProvider>(context, listen: false).addLesson(newLesson);
                  Navigator.pop(context);
                }
              },
              child: Text("Сохранить"),
            )
          ],
        ),
      ),
    );
  }
}