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
    const CurrentTaskStatusScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_selectedIndex == 0 ? 70 : 60),
        child: AppBar(
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          backgroundColor: AppColors.thirdBg,
          title: _selectedIndex == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(_appBarTitles[_selectedIndex]),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Hey',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ' Buddy!',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mainFg,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])
              : Text(_appBarTitles[_selectedIndex]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  _showLogoutBottomSheet(context);
                },
                child: SvgIcon(
                  IconsAssets.hamburgerMenu,
                ),
              ),
            )
          ],
        ),
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

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.thirdBg,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              CustomButton(
                verticalPadding: 10,
                backgroundColor: AppColors.secondaryBg,
                radius: 10,
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(24.0),
                          decoration: BoxDecoration(
                            color: AppColors.thirdBg,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Confirm Logout',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              Text(
                                'Are you sure you want to logout?',
                                style: TextStyle(
                                  color: AppColors.white50Opacity,
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomButton(
                                    backgroundColor: AppColors.opaqueColor,
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  CustomButton(
                                    backgroundColor: AppColors.red,
                                    child: const Text(
                                      'Logout',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(
                      IconsAssets.logOutIcon,
                      color: AppColors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Logout",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
