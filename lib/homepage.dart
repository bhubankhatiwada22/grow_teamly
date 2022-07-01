import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktaktoe/features/attendance/views/attendance_view.dart';
import 'package:tiktaktoe/features/daily_update/views/daily_update_view.dart';
import 'package:tiktaktoe/features/dashboard/views/dashboard_view.dart';
import 'package:tiktaktoe/features/leaves/views/leaves_view.dart';
import 'package:tiktaktoe/features/profile/views/profile_view.dart';
import 'package:tiktaktoe/injector.dart';
import 'package:tiktaktoe/loginpage.dart';
import 'package:tiktaktoe/providers/counter_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages = [
    DashboardView(),
    DailyUpdateView(),
    AttendanceView(),
    LeaveView(),
    ProfileView(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // SystemNavigator.pop();
        if (_currentIndex == 0) {
          SystemNavigator.pop();
        } else {
          setState(() {
            _currentIndex = 0;
          });
        }
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text("homepage"),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           locator.get<SharedPreferences>().clear();
        //           Navigator.pushAndRemoveUntil(
        //               context,
        //               MaterialPageRoute(builder: (context) => LoginPage()),
        //               (route) => false);
        //         },
        //         icon: Icon(Icons.logout))
        //   ],
        // ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.red,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.update,
                ),
                label: "update",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.insights,
                ),
                label: "insights",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.holiday_village,
                ),
                label: "Leaves",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "profile"),
            ]),
      ),
    );
  }
}
