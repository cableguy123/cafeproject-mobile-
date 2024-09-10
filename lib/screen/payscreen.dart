import 'package:flutter/material.dart';
import '../design/fontColors/ProjectColors.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PayScreenBodyWidget();
  }
}

class PayScreenBodyWidget extends StatefulWidget {
  const PayScreenBodyWidget({super.key});

  @override
  State<PayScreenBodyWidget> createState() => _PayScreenBodyWidgetState();
}

class _PayScreenBodyWidgetState extends State<PayScreenBodyWidget>
    with AutomaticKeepAliveClientMixin<PayScreenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: const PayScreenContainer(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class PayScreenContainer extends StatefulWidget {
  const PayScreenContainer({super.key});

  @override
  State<PayScreenContainer> createState() => _PayScreenContainerState();
}

class _PayScreenContainerState extends State<PayScreenContainer> {
  @override
  Widget build(BuildContext context) {
    // MediaQueryを使用して画面の幅と高さを取得
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        SizedBox(
          width: screenWidth * 0.92, // 画面幅の90%に設定
          height: screenHeight * 0.3, // 画面高さの25%に設定
          child: Card(
            color: Projectcolors.kPrimaryWhiteColor,
            child: Center(
              child: Text(
                'Example Card',
                style: TextStyle(color: Projectcolors.kPrimaryBlackColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              // 背景ウィジェット
              Container(
                color: Projectcolors.kPrimaryWhiteColor,
              ),
              // Positioned を使ってウィジェットを重ねて配置
              Positioned(
                left: screenWidth * 0.05,
                bottom: screenHeight * 0.38,
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Projectcolors.kPrimaryWhiteColor,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft, // 左寄せに配置
                    child: Text(
                      "ご利用にはログインが必要です",
                      style: TextStyle(
                        color: Projectcolors.kPrimaryBlackColor, // 任意で色を指定
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.05,
                bottom: screenHeight * 0.32,
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Projectcolors.kPrimaryGrayColor,
                  ),
                  child: Center(
                    child: Text("ORコード決済です。クレジットカードの登録が必要です"),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 140,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  // 左辺だけに余白を追加
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Projectcolors.kPrimaryBlackColor,
                      foregroundColor: Projectcolors.kPrimaryWhiteColor,
                    ),
                    onPressed: () {},
                    child: Text("ログイン"),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 80,
                child: Container(
                  padding: EdgeInsets.only(left: 230.0, right: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Projectcolors.kPrimaryBlackColor,
                      foregroundColor: Projectcolors.kPrimaryWhiteColor,
                    ),
                    onPressed: () {},
                    child: const Text('新規会員登録'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
