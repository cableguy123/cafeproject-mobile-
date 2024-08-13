import 'package:cafeproject/screen/accountscreen.dart';
import 'package:cafeproject/screen/homescreen.dart';
import 'package:cafeproject/screen/orderscreen.dart';
import 'package:cafeproject/screen/payscreen.dart';
import 'package:cafeproject/screen/storescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/fontColors/ProjectColors.dart';
import '../../model/bottom_navigation_bar.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return HomeBottomBarWidget();
  }
}
class HomeBottomBarWidget extends StatefulWidget {
  const HomeBottomBarWidget({super.key});
  @override
  State<HomeBottomBarWidget> createState() => _HomeBottomBarWidgetState();
}
class _HomeBottomBarWidgetState extends State<HomeBottomBarWidget> {
  // ページ移動時インデックス
  final pageController = PageController();
  int _currentIndex = 0;
  static const _screen = [
    HomeScreen(),
    PayScreen(),
    StoreScreen(),
    OrderScreen(),
    AccountScreen(),
  ];
  void _onTap(index) {
    pageController.jumpToPage(index);
  }
  void _onItemTapped(int index) => setState(() {
    _currentIndex = index;
  });
  List<BottomNavigationBarItem> bottomNavigationItemFunc() {
    const List<BottomNavigationBarItemData> bottomBarItems = [
      BottomNavigationBarItemData(iconData: Icons.home, label: 'Home'),
      BottomNavigationBarItemData(iconData: Icons.qr_code, label: 'Pay'),
      BottomNavigationBarItemData(iconData: Icons.store, label: 'Store'),
      BottomNavigationBarItemData(iconData: Icons.access_time_filled, label: 'Order'),
      BottomNavigationBarItemData(iconData: Icons.account_circle, label: 'Account'),
    ];
    return bottomBarItems.map((item) {
      return BottomNavigationBarItem(
          icon: Icon(item.iconData),
          label: item.label
      );
    }).toList();
  }
  TextStyle labelTextSize() {
    return const TextStyle(fontSize: 12);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: _onItemTapped,
        children: _screen,
        physics: const AlwaysScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationItemFunc(),
      currentIndex: _currentIndex,
      onTap: _onTap,
      // アニメーション効果 false
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Projectcolors.kPrimaryGreenColor,
      unselectedItemColor: Projectcolors.kPrimaryBlackColor,
      selectedLabelStyle: labelTextSize(),
      unselectedLabelStyle: labelTextSize(),
      ),
    );
  }

}