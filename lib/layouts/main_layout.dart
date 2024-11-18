import 'package:attendance_ui_app/pages/attendance_page.dart';
import 'package:attendance_ui_app/widgets/application_bar.dart';
import 'package:attendance_ui_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  final _date = DateTime.now();

  final _tabs = const [
    Tab(
      text: 'MAPS',
    ),
    Tab(
      text: 'ATTENDANCE',
    ),
    Tab(
      text: 'SALES',
    ),
    Tab(
      text: 'TICKETS',
    ),
    Tab(
      text: 'INVESTMENTS',
    ),
  ];

  late final _tabController = TabController(
    length: _tabs.length,
    vsync: this,
    initialIndex: 1,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: ApplicationBar(
        date: _date,
        controller: _tabController,
        tabs: _tabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Placeholder(),
          AttendancePage(),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
