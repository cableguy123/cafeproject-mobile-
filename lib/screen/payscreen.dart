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
class _PayScreenBodyWidgetState extends State<PayScreenBodyWidget> with AutomaticKeepAliveClientMixin<PayScreenBodyWidget>{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

