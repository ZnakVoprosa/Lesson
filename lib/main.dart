import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/schedule_provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_lesson_screen.dart'; // <--- Импортируем экран формы

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ScheduleProvider()..loadFromFile('default'),
    child: MaterialApp(
      debugShowCheckedModeBanner: false, // Убираем надпись "Debug"
      theme: ThemeData.dark(),
      home: HomeScreen(),
      // Вот здесь мы прописываем маршруты:
      routes: {
        '/add': (context) => AddLessonScreen(),
      },
    ),
  ),
);