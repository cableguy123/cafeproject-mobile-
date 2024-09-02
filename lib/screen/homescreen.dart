import 'package:cafeproject/screen/login/loginscreen.dart';
import 'package:cafeproject/screen/settingscreen.dart';
import 'package:cafeproject/screen/signup/createuser.dart';
import 'package:flutter/material.dart';
import '../design/fontColors/ProjectColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: HomeContainer(),
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


// TODO: This is AppBar
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
class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}
class _HomeContainerState extends State<HomeContainer> {
  DateTime nowTime = DateTime.now();
  final String newItem = "今週の新商品";
  final String saleItem = "今週割引商品";
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
  void _onPressedLogin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        )
    );
  }
  void _onPressedSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => createUserScreen(),
      )
    );
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
            TextWidget(height: 10, text: newItem),
            const Divider(height: 10),
            TextWidget(height: 140, text: saleItem),
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
                      ButtonWidget(onPressed: _onPressedLogin,color: Projectcolors.kPrimaryBlackColor,fontColor: Projectcolors.kPrimaryWhiteColor, child: const Text("ログイン")),
                      ButtonWidget(onPressed: _onPressedSignUp,color: Projectcolors.kPrimaryBlackColor,fontColor: Projectcolors.kPrimaryWhiteColor,child: const Text("新規会員登録"),),
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
  final void Function(BuildContext) onPressed;
  final Color color;
  final Color fontColor;
  const ButtonWidget({super.key,required this.child,required this.onPressed,required this.color,required this.fontColor});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => onPressed(context),style:ElevatedButton.styleFrom(backgroundColor: color,foregroundColor: fontColor), child: child);
  }
}

