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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: HomeAppBar(),
        body: HomeContainer(),
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
    // return Padding(
    //   padding: EdgeInsets.all(20),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment,
    //   ),
    // );
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


// Text(message(nowTime),style: const TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold))

