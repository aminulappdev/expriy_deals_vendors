import 'package:expriy_deals_vendors/app/modules/home/views/home_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/profile_screen.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainButtonNavbarScreen extends StatefulWidget {
  static String routeName = '/mainbottom-nav-screen';

  const MainButtonNavbarScreen({super.key});

  @override
  State<MainButtonNavbarScreen> createState() => _MainButtonNavbarScreenState();
}

class _MainButtonNavbarScreenState extends State<MainButtonNavbarScreen> {
  int _currentPage = 0;
  String _currentTitle = "Home";
  Color _currentColor = Colors.black;
  Color _inactiveColor = AppColors.iconButtonThemeColor;

  List<TabDataModel> tabs = [
    TabDataModel(iconData: Icons.home, title: "Home", tabColor: Colors.orange),
    TabDataModel(iconData: Icons.add_box, title: "Cart", tabColor: Colors.blue),
    TabDataModel(iconData: Icons.menu, title: "List", tabColor: Colors.green),
    TabDataModel(iconData: Icons.analytics, title: "Profile", tabColor: Colors.purple),
    TabDataModel(iconData: Icons.settings, title: "Settings", tabColor: Colors.red), // New tab
  ];

  List<Widget> pageList = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentPage], // Display the selected page based on the current tab index
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.iconButtonThemeColor, // Border color around the entire BottomNavigationBar
              width: 1.0, // Border width
            ),
            borderRadius: BorderRadius.circular(30), // Optional: Rounded corners for the bottom bar
          ),
          child: BottomNavigationBar(
            elevation: 0.0, // Remove shadow by setting elevation to 0
            currentIndex: _currentPage,
            onTap: (index) {
              setState(() {
                _currentPage = index;
                _currentTitle = tabs[index].title;
              });
            },
            items: tabs
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: Icon(
                      tab.iconData,
                      color: _currentPage == tabs.indexOf(tab)
                          ? Colors.black
                          : _inactiveColor,
                    ),
                    label: tab.title, // Title for each tab
                  ),
                )
                .toList(),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: _currentColor,
            unselectedItemColor: _inactiveColor,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent, // Background color is now transparent (handled by container)
            selectedFontSize: 14,
            unselectedFontSize: 12,
          ),
        ),
      ),
    );
  }
}

// Model class for tabs
class TabDataModel {
  final IconData iconData;
  final String title;
  final Color tabColor;

  TabDataModel({
    required this.iconData,
    required this.title,
    required this.tabColor,
  });
}
