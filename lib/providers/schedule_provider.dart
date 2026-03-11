 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import '../models/lesson.dart';
import '../models/bell_schedule.dart';

class ScheduleProvider with ChangeNotifier {
  List<Lesson> _lessons = [];
  List<Lesson> get lessons => _lessons;

  int _currentWeek = 1;
  int get currentWeek => _currentWeek;
  void toggleWeek() { _currentWeek = _currentWeek == 1 ? 2 : 1; }

  Future<void> load() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final f = File('${dir.path}/data.lesson');
      if (f.existsSync()) {
        final json = jsonDecode(await f.readAsString());
        _lessons = (json['lessons'] as List).map((e) => Lesson.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (_) {}
  }
}