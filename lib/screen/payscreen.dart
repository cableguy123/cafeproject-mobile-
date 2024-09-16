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
              child: PaymentdetailCardWidget(),
            ),
          ),
        ),
        Expanded(
          // Stackを用いて一つの画面に複数のwidgetを重ねることができる
          // childrenに与えたwidgetが重なっていく
          child: Stack(
            children: <Widget>[
              PositionedLoginMessageWidget(
                leftValue: 0.05,
                bottomValue: 0.38,
                heightValue: 0.15,
                color: Projectcolors.kPrimaryBlackColor,
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
              PaymentInfoWidget(
                leftValue: 0.05,
                bottomValue: 0.32,
                widthValue: 0.6,
                heightValue: 0.12,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Projectcolors.kPrimaryGrayColor,
                  ),
                  child: Center(
                    child: Text("ORコード決済です。クレジットカードの登録が必要です"),
                  ),
                ),
              ),
              CustomButtonWidget(
                  leftValue: 0.65,
                  bottomValue: 0.11,
                  widthValue: 0.3,
                  heightValue: 0.04,
                borderRadius: BorderRadius.circular(10.0),
                backgroundColor: Projectcolors.kPrimaryBlackColor,
                foregroundColor: Projectcolors.kPrimaryWhiteColor,
                childText: const Text("ログイン"),
                onPressedAction: () {},
              ),
              CustomButtonWidget(
                leftValue: 0.62,
                bottomValue: 0.06,
                widthValue: 0.33,
                heightValue: 0.04,
                borderRadius: BorderRadius.circular(10.0),
                backgroundColor: Projectcolors.kPrimaryBlackColor,
                foregroundColor: Projectcolors.kPrimaryWhiteColor,
                childText: const Text("新規登録"),
                onPressedAction: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PaymentdetailCardWidget extends StatelessWidget {
  const PaymentdetailCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Example Card',
      style: TextStyle(color: Projectcolors.kPrimaryBlackColor),
    );
  }
}

class PositionedLoginMessageWidget extends StatelessWidget {
  final double leftValue;
  final double bottomValue;
  final double heightValue;
  final Color color;
  final Widget child;

  const PositionedLoginMessageWidget({
    super.key,
    required this.leftValue,
    required this.bottomValue,
    required this.heightValue,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // Positioned を使って子widgetの位置をピクセル単位で指定できる
    return Positioned(
      left: screenWidth * leftValue,
      bottom: screenHeight * bottomValue,
      height: screenHeight * heightValue,
      child: child,
    );
  }
}

class PaymentInfoWidget extends StatelessWidget {
  final double leftValue;
  final double bottomValue;
  final double widthValue;
  final double heightValue;
  final Widget child;

  const PaymentInfoWidget({
    super.key,
    required this.leftValue,
    required this.bottomValue,
    required this.widthValue,
    required this.heightValue,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // Positioned を使って子widgetの位置をピクセル単位で指定できる
    return Positioned(
      left: screenWidth * leftValue,
      bottom: screenHeight * bottomValue,
      width: screenWidth * widthValue,
      height: screenHeight * heightValue,
      child: child,
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  final double leftValue;
  final double bottomValue;
  final double widthValue;
  final double heightValue;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color foregroundColor;
  final Text childText;
  final VoidCallback onPressedAction;

  const CustomButtonWidget({
    super.key,
    required this.leftValue,
    required this.bottomValue,
    required this.widthValue,
    required this.heightValue,
    required this.borderRadius,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.childText,
    required this.onPressedAction,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      left: screenWidth * leftValue,
      bottom: screenHeight * bottomValue,
      width: screenWidth * widthValue,
      height: screenHeight * heightValue,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        onPressed: onPressedAction,
        child: childText,
      ),
    );
  }
}
