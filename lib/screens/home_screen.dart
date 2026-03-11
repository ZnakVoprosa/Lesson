import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule_provider.dart';
import 'day_screen.dart';
import 'week_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Schedule')),
      body: Column(
        children: [
          Expanded(child: DayScreen()),
        ],
      ),
    );
  }
}