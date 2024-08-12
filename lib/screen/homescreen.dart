import 'package:cafeproject/design/fontColors/ProjectColors.dart';
import 'package:cafeproject/model/bottom_navigation_bar.dart';
import 'package:cafeproject/screen/payscreen.dart';
import 'package:cafeproject/screen/settingscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeContainer(),
      bottomNavigationBar: HomeBottomBarWidget(),
    );
  }
}


// TODO This is AppBar
class HomeAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconWidgetButton(iconsValue: Icons.account_circle,tooltipValue: 'account',iconPressed: _navigateToSettings);
        },
      ),
      actions: <Widget>[
        IconWidgetButton(iconsValue: Icons.notifications, tooltipValue: 'alarm', iconPressed: _navigateToSettings),
        IconWidgetButton(iconsValue: Icons.settings, tooltipValue: 'settings', iconPressed: _navigateToSettings),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  // TODO: NavigatorPush
  void _navigateToSettings(BuildContext context) {
    Navigator.of(context).push(_createRoute());
  }
  // TODO: PageMoveAnimation
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SettingScreen(),
      transitionsBuilder: (context,animation,secondaryAnimation,child) {
        const begin = Offset(1.0,0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
class IconWidgetButton extends StatelessWidget {
  final IconData iconsValue;
  final String tooltipValue;
  final void Function(BuildContext) iconPressed;
  const IconWidgetButton({
    super.key,required this.iconsValue,required this.tooltipValue,required this.iconPressed
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconsValue),
      tooltip: tooltipValue,
      onPressed: () => iconPressed(context),
    );
  }
}
class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}
class _HomeContainerState extends State<HomeContainer> {
  DateTime nowTime = DateTime.now();
  final String newItem = "今週の新商品";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message(nowTime),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            SizedBox(height: 10),
            Text(newItem),
            Divider(height: 10),
          ],
        ),
      ),
    );
  }
  String message(DateTime currentTime) {
    final now = currentTime.hour;
    final minutes = currentTime.minute;
    if (now >= 6 && now < 12) {
      return("おはようございます");
    } else if ((now == 12 && minutes >= 1) || (now > 12 && now < 18)) {
      return("こんにちは");
    } else {
      return("こんばんは");
    }
  }
}
class HomeBottomBarWidget extends StatefulWidget {
  const HomeBottomBarWidget({super.key});
  @override
  State<HomeBottomBarWidget> createState() => _HomeBottomBarWidgetState();
}
class _HomeBottomBarWidgetState extends State<HomeBottomBarWidget> {
  // ページ移動時インデックス
  int _currentIndex = 0;
  // ページ移動するスクリーン
  final List<Widget> pageWidgets = [
    const HomeContainer(),
    const PayScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavigationItemFunc(),
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      // アニメーション効果 false
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Projectcolors.kPrimaryGreenColor,
      unselectedItemColor: Projectcolors.kPrimaryBlackColor,
      selectedLabelStyle: labelTextSize(),
      unselectedLabelStyle: labelTextSize(),
    );
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
}





