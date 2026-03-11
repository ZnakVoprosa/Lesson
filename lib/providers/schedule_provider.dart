import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../models/lesson.dart';

class ScheduleProvider with ChangeNotifier {
  List<Lesson> _lessons = [];
  int _currentViewWeek = 1;
  List<Lesson> get lessons => _lessons;
  int get currentViewWeek => _currentViewWeek;

  void toggleWeek() { _currentViewWeek = _currentViewWeek == 1 ? 2 : 1; notifyListeners(); }

  Future<void> saveToFile(String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName.lesson');
    await file.writeAsString(jsonEncode(_lessons.map((e) => e.toJson()).toList()));
  }

  Future<void> loadFromFile(String fileName) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$fileName.lesson');
      final data = jsonDecode(await file.readAsString());
      _lessons = (data as List).map((e) => Lesson.fromJson(e)).toList();
      notifyListeners();
    } catch (_) {}
  }

  void addLesson(Lesson l) { _lessons.add(l); notifyListeners(); }
}