import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';
import 'package:task_management/core/res/color.dart';
import 'package:task_management/core/routes/routes.dart';
import 'package:task_management/pages/nampilinAPI.dart';
import 'package:task_management/pages/nampilinDiklat.dart';
import 'package:task_management/pages/nampilinGelar.dart';
import 'package:task_management/pages/nampilinPenelitian.dart';
import 'package:task_management/pages/onboarding.dart';
import 'package:task_management/pages/today_task.dart';
import 'package:task_management/widgets/circle_gradient_icon.dart';
import 'package:task_management/widgets/task_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const String prefSelectedIndexKey = 'selectedIndex';
  DateTime now = DateTime.now();
  late DateTime date = DateTime(now.year, now.month, now.day);
  late String dateFormat = date.toString().replaceAll("00:00:00.000", "");
  @override
  void initState() {
    super.initState();
    getCurrentIndex();
  }

  void getCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSelectedIndexKey)) {
      setState(() {
        final index = prefs.getInt(prefSelectedIndexKey);
        if (index == 1) {
          print('1');
            Navigator.pushNamed(context, Routes.todaysTask);
        } else if (index == 2) {
          print("2");
            Navigator.pushNamed(context, Routes.api);
        } else if (index == 3) {
          print("3");
            Navigator.pushNamed(context, Routes.diklat);
        } else if (index == 4) {
          print("4");
            Navigator.pushNamed(context, Routes.penelitian);
        } else if (index == 5) {
          print("5");
            Navigator.pushNamed(context, Routes.gelar);
        }
         if (index != null) {
          print("not null");
          _selectedIndex = index;
        }
      });
    }
  }

  void saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, _selectedIndex);
    print(_selectedIndex);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dateFormat,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleGradientIcon(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                saveCurrentIndex();
                Navigator.pushNamed(context, Routes.todaysTask);
              },
              icon: Icons.calendar_month,
              color: Colors.purple,
              iconSize: 24,
              size: 40,
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      extendBody: true,
      body: _buildBody(),
    );
  }

  Stack _buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _taskHeader(),
                const SizedBox(
                  height: 15,
                ),
                buildGrid(),
                const SizedBox(
                  height: 10,
                ),
                const OnGoingTask(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _taskHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectableText(
          "Universitas Lampung",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
      ],
    );
  }

  StaggeredGrid buildGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pink,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.all(10.0),
                width: 58.0,
                height: 150.0,
                child: Column(
                  children: const [
                    Align(alignment: Alignment.bottomCenter),
                    Icon(Icons.house, size: 50, color: Colors.pink),
                    Text(
                      'Kumpulan Jurusan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Raleway",
                          color: Colors.pink),
                    )
                  ],
                )),
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
              saveCurrentIndex();

              Navigator.pushNamed(context, Routes.api);
            }),
        GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.all(10.0),
                width: 58.0,
                height: 150.0,
                child: Column(
                  children: const [
                    Align(alignment: Alignment.bottomCenter),
                    Icon(Icons.archive, size: 50, color: Colors.orange),
                    Text(
                      'Kumpulan Diklat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Raleway",
                          color: Colors.orange),
                    )
                  ],
                )),
            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
              saveCurrentIndex();
              Navigator.pushNamed(context, Routes.diklat);
            }),
        GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.all(10.0),
                width: 58.0,
                height: 150.0,
                child: Column(
                  children: const [
                    Align(alignment: Alignment.bottomCenter),
                    Icon(Icons.science, size: 50, color: Colors.green),
                    Text(
                      'Kumpulan Penelitian',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Raleway",
                          color: Colors.green),
                    )
                  ],
                )),
            onTap: () {
              setState(() {
                _selectedIndex = 4;
              });
              saveCurrentIndex();
              Navigator.pushNamed(context, Routes.penelitian);
            }),
        GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.all(10.0),
                width: 58.0,
                height: 150.0,
                child: Column(
                  children: const [
                    Align(alignment: Alignment.bottomCenter),
                    Icon(Icons.school, size: 50, color: Colors.blue),
                    Text(
                      'Kumpulan Gelar Akademik',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Raleway",
                          color: Colors.blue),
                    )
                  ],
                )),
            onTap: () {
              setState(() {
                _selectedIndex = 5;
              });
              saveCurrentIndex();
              Navigator.pushNamed(context, Routes.gelar);
            }),
      ],
    );
  }
}

class OnGoingTask extends StatelessWidget {
  const OnGoingTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }
}
