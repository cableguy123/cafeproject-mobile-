import 'package:cafeproject/design/fontColors/ProjectColors.dart';
import 'package:flutter/material.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: BuildAppBar(),
        body: BuildContainer(),
      );
  }
}

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key});
  @override
  Widget build(BuildContext context) {
      return AppBar(
        centerTitle: false,
        titleSpacing: 2.5,
        leading: SettingIconButton(settingIcons: Icons.arrow_left, settingTooltipValue: 'before', settingIconPressed: _navigateToHome),
        title: const Text("設定",style: TextStyle(color: Projectcolors.kPrimaryBlackColor)),
        shape: const Border(
          bottom: BorderSide(
            color: Projectcolors.kPrimaryGrayColor,
            width: 0.95,
          ),
        ),
      );
    }
  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pop(context);
  }
  @override
  Size get preferredSize=> const Size.fromHeight(kToolbarHeight);
}
class BuildContainer extends StatelessWidget {
  static const settingList = [
    "利用ガイド",
    "ヘルプ",
    "利用規約",
    "プライバシーポリシー",
    "ライセンス"
  ];
  const BuildContainer({super.key});
  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(0),
        color: Projectcolors.kPrimaryGrayColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 15,left: 14,bottom: 15),
              child: const Text('アプリについて',style: TextStyle(color: Projectcolors.kPrimaryBlackColor,fontSize: 10)),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  itemCount: settingList.length,
                  itemBuilder: (BuildContext context,int index) {
                    return ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              settingList[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_right,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context,index) {
                    return Divider(height: 0.5);
                  },
                ),
              ),
            )
          ],
        ),
      );
    }
}
class SettingIconButton extends StatelessWidget {
  final IconData settingIcons;
  final String settingTooltipValue;
  final void Function(BuildContext) settingIconPressed;
  const SettingIconButton({
    super.key,
    required this.settingIcons,
    required this.settingTooltipValue,
    required this.settingIconPressed
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(settingIcons),
      tooltip: settingTooltipValue,
      onPressed: () => settingIconPressed(context),
    );
  }
}