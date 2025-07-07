import 'package:expriy_deals_vendors/app/modules/home/views/home_screen.dart';
import 'package:expriy_deals_vendors/app/modules/earnings/views/earning_screen.dart';
import 'package:expriy_deals_vendors/app/modules/order/views/order_details_show_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/views/product_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/profile_screen.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainButtonNavbarScreen extends StatefulWidget {
  static String routeName = '/mainbottom-nav-screen';

  const MainButtonNavbarScreen({super.key});

  @override
  State<MainButtonNavbarScreen> createState() => _MainButtonNavbarScreenState();
}

class _MainButtonNavbarScreenState extends State<MainButtonNavbarScreen> {
  int _currentPage = 0;
  String _currentTitle = "main_button_navbar_screen.home".tr;
  Color _currentColor = Colors.black;
  Color _inactiveColor = AppColors.iconButtonThemeColor;

  List<TabDataModel> tabs = [
    TabDataModel(iconData: Icons.home, title: "main_button_navbar_screen.home".tr, tabColor: Colors.orange),
    TabDataModel(iconData: Icons.add_box, title: "main_button_navbar_screen.products".tr, tabColor: Colors.blue),
    TabDataModel(iconData: Icons.menu, title: "main_button_navbar_screen.orders".tr, tabColor: Colors.green),
    TabDataModel(iconData: Icons.analytics, title: "main_button_navbar_screen.earnings".tr, tabColor: Colors.purple),
    TabDataModel(iconData: Icons.person, title: "main_button_navbar_screen.profile".tr, tabColor: Colors.red),
  ];

  List<Widget> pageList = [
    HomeScreen(),
    ProductScreen(shouldBackButton: false),
    OrderScreen(),
    EarningScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentPage],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.iconButtonThemeColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
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
                    label: tab.title,
                  ),
                )
                .toList(),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: _currentColor,
            unselectedItemColor: _inactiveColor,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            selectedFontSize: 14,
            unselectedFontSize: 12,
          ),
        ),
      ),
    );
  }
}

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