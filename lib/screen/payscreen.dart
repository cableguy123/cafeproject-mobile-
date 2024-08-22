import 'package:cafeproject/screen/homescreen.dart';
import 'package:flutter/material.dart';

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

// AutomaticKeepAliveClientMixin はStateを保持したまま画面遷移するため
class _PayScreenBodyWidgetState extends State<PayScreenBodyWidget>
    with AutomaticKeepAliveClientMixin<PayScreenBodyWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _redBoxWidget(),
            ),
            Expanded(
              child: _redBoxWidget(),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 258.0, right: 20.0),
                    // 左辺だけに余白を追加
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 任意の角丸さを指定
                        ),
                        backgroundColor: Colors.black, // ボタンの背景色
                        foregroundColor: Colors.white, //
                      ),
                      onPressed: () {},
                      child: Text('ログイン'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 230.0, right: 20.0),
                    // 左辺だけに余白を追加
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10.0), // 任意の角丸さを指定
                        ),
                        backgroundColor: Colors.black, // ボタンの背景色
                        foregroundColor: Colors.white, //
                      ),
                      onPressed: () {},
                      child: Text('新規会員登録'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _redBoxWidget() {
  return Container(
    // 中央配置を確認するためwidthとheightを100に設定
    width: 300,
    height: 100,
    color: Colors.red,
    margin: EdgeInsets.all(10.0),
  );
}


