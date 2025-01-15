import 'package:flutter/material.dart';

import '../../../../core/widgets/general_toolbar.dart';
import '../widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      {
        "title": "Watch 1 design masterclass",
        "time": "18h30",
        "isCompleted": false,
        "priorityColor": Colors.red,
      },
      {
        "title": "Feed the cat",
        "time": "20h30",
        "isCompleted": false,
        "priorityColor": Colors.yellow,
      },
      {
        "title": "Feed the cat",
        "time": "20h30",
        "isCompleted": true,
        "priorityColor": Colors.green,
      },
    ];

    return Scaffold(
      appBar: GeneralToolbar(
        title: "Home",
        onMenuPressed: () {
          // Handle menu button logic
          print("Menu button pressed");
        },
        onCalendarPressed: () {
          // Handle calendar button logic
          print("Calendar button pressed");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeWidgets.buildTitle(title: 'Tasks'),
            const SizedBox(height: 16.0),
            HomeWidgets.buildSearchField(
              onSearch: (value) {
                print('Search: $value');
              },
            ),
            const SizedBox(height: 16.0),
            HomeWidgets.buildSectionHeader(header: "Today's Tasks"),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return HomeWidgets.buildTaskItem(
                    title: task['title'] as String,
                    time: task['time'] as String,
                    isCompleted: task['isCompleted'] as bool,
                    priorityColor: task['priorityColor'] as Color,
                    onTap: () {
                      print('Tapped on: ${task['title']}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}