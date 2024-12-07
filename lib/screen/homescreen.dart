import 'package:cafeproject/model/db_model/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../design/fontColors/ProjectColors.dart';

const Map<int,String> naviIndexEndpoint = {
  0: '/home',
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeContainer(),
      bottomNavigationBar: BottomNaviWidget(),
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


// TODO: This is AppBar
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  // TODO: NavigatorPush
  void _navigationToAlarm(BuildContext context) {
    GoRouter.of(context).go('/home/alarm');
  }
  void _navigateToSettings(BuildContext context) {
    GoRouter.of(context).go('/home/settings');
  }
  void _navigationToProfile(BuildContext context) {
    GoRouter.of(context).go('/home/login');
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconWidgetButton(iconsValue: Icons.account_circle,tooltipValue: 'account',iconPressed: _navigationToProfile);
        },
      ),
      actions: <Widget>[
        IconWidgetButton(iconsValue: Icons.notifications, tooltipValue: 'alarm', iconPressed: _navigationToAlarm),
        IconWidgetButton(iconsValue: Icons.settings, tooltipValue: 'settings', iconPressed: _navigateToSettings),
      ]
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}
class _HomeContainerState extends State<HomeContainer> {
  DateTime nowTime = DateTime.now();
  final Text _loginText = const Text("ログイン");
  final Text _createUserText = const Text("新規会員登録");
  final String _newItem = "今週新商品";
  final String _saleItem = "今週割引商品";
  
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message(nowTime),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            const SizedBox(height: 10),
            TextWidget(height: 10, text: _newItem),
            const Divider(height: 10),
            TextWidget(height: 140, text: _saleItem),
            const Divider(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ButtonWidget(pressedFunc: () => context.go('/login'), color: Projectcolors.kPrimaryBlackColor, fontColor: Projectcolors.kPrimaryWhiteColor, child: _loginText),
                      ButtonWidget(pressedFunc: () => context.go('/create'), color: Projectcolors.kPrimaryBlackColor, fontColor: Projectcolors.kPrimaryWhiteColor, child: _createUserText),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// TODO: This is BottomNavigationBar
class BottomNaviWidget extends StatefulWidget {
  const BottomNaviWidget({super.key});
  @override
  State<BottomNaviWidget> createState() => _BottomNaviWidgetState();
}

class _BottomNaviWidgetState extends State<BottomNaviWidget> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;
  // 初期状態
  @override
  void initState() {
    super.initState();
    // 初期状態 TabBar
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_tabListener);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  void _tabListener() {
    setState(() {
      _currentIndex = _tabController.length;
    });
  }
  void onTapBottomNavigation(int idx) {

  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex ?? 0,
      selectedFontSize: 10.0,
      unselectedFontSize: 10.0,
      type: BottomNavigationBarType.fixed, items: [],
    );
  }
}

// TODO: IconWidgetButton
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
// TODO: TextWidget
class TextWidget extends StatelessWidget {
  final double height;
  final String text;
  const TextWidget({super.key,required this.height,required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height),
      child: Text(text),
    );
  }
}
// TODO: Login,SignUp ButtonWidget
class ButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function() pressedFunc;
  final Color color;
  final Color fontColor;
  const ButtonWidget({super.key,required this.pressedFunc,required this.color,required this.fontColor,required this.child});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressedFunc,
      style:ElevatedButton.styleFrom(backgroundColor: color,foregroundColor: fontColor),
      child: child,
    );
  }
}

