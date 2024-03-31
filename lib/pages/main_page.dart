
import 'package:code0/pages/home_page.dart';
import 'package:code0/pages/report/report_progress.dart';
import 'package:code0/pages/report_page.dart';
import 'package:code0/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<GButton> button = [
    const GButton(
      icon: Icons.home,
      text: 'Home',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
    const GButton(
      icon: Icons.file_copy_sharp,
      text: 'Report',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
    const GButton(
      icon: Icons.history_edu_rounded,
      text: 'History',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
    const GButton(
      icon: Icons.settings,
      text: 'Settings',
      iconActiveColor: Colors.white,
      textColor: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: selectedIndex == 0
            ? const HomePage()
            : selectedIndex == 1
                ? const ReportPage()
                : selectedIndex == 2
                    ? const ReportProgress()
                    // const HistoryPage()
                    : const SettingsPage(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[100]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,

                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.black,
                // color: Colors.black,
                tabs: button,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
