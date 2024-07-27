import 'package:cafeproject/screen/payScreen.dart';
import 'package:cafeproject/screen/settingDetail.dart';
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
    );
  }
}


// TODO This is AppBar
class HomeAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const settingDetails(),
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
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.alarm),
          tooltip: 'alarm',
          onPressed: () {

          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'settings',
          onPressed: () {
              Navigator.of(context).push(
                  _createRoute()
              );
          }
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}


