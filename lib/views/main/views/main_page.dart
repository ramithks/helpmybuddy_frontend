import 'package:flutter/material.dart';
import 'package:helpmybuddy_frontend/global_index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<String> _appBarTitles = [
    "Help Buddy - Home",
    "Ask Help",
    "Current Task Status",
    "Profile"
  ];

  final List<Widget> _pages = [
    Container(
      color: AppColors.mainBg,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.thirdBg,
        title: Text(_appBarTitles[_selectedIndex]),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {},
              child: SvgIcon(
                IconsAssets.hamburgerMenu,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.mainBg,
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.thirdBg,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SvgIcon(_selectedIndex == 0
                      ? IconsAssets.homeFilled
                      : IconsAssets.homeRegular),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgIcon(_selectedIndex == 1
                    ? IconsAssets.plusSquareFilled
                    : IconsAssets.plusSquareRegular),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgIcon(_selectedIndex == 2
                    ? IconsAssets.progresssFilled
                    : IconsAssets.progresssRegular),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgIcon(_selectedIndex == 3
                    ? IconsAssets.profileFilled
                    : IconsAssets.profileRegular),
                label: ''),
          ],
        ),
      ),
    );
  }
}
