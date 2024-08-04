import 'package:cafeproject/screen/settingScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: HomeAppBar(),
      ),
      initialRoute: '/',
      routes: {
        '/setting': (context) => SettingScreen(),
      },
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
        IconWidgetButton(iconsValue: Icons.alarm, tooltipValue: 'alarm', iconPressed: _navigateToSettings),
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




