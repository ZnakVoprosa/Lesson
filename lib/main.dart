import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/schedule_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleProvider())
      ],
      child: MaterialApp(
        title: 'My Schedule',
        theme: ThemeData.dark(),
        home: HomeScreen(),
        onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => HomeScreen()),
      ),
    ),
  );
}