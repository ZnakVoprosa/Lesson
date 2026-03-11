import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/schedule_provider.dart';
import 'day_screen.dart';
import 'week_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text("Расписание"), bottom: TabBar(tabs: [Tab(text: "День"), Tab(text: "Неделя")])),
        body: TabBarView(children: [DayScreen(), WeekScreen()]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/add'),
        ),
      ),
    );
  }
}