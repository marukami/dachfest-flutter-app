import 'package:dachfest/data/local_data.dart';
import 'package:dachfest/domain/domain.dart';
import 'package:dachfest/presentation/day_screen.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen();

  @override
  ScheduleScreenState createState() {
    return new ScheduleScreenState();
  }
}

class ScheduleScreenState extends State<ScheduleScreen> {
  int _currentIndex = 0;

  Schedule _schedule;

  var _currentScreen;

  @override
  void initState() {
    super.initState();
    getSchedule(context).then((schedule) {
      setState(() {
        _schedule = schedule;
        _currentScreen = DayScreen(_schedule.day1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DACHFest"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text("Day 1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text("Day 2"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text("Info"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                _currentScreen = DayScreen(_schedule.day1);
                break;
              case 1:
                _currentScreen = DayScreen(_schedule.day2);
                break;
              case 2:
                _currentScreen = Text("info");
                break;
            }
          });
        },
      ),
      body: Container(
        child: _currentScreen,
      ),
    );
  }
}