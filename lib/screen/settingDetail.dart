import 'package:cafeproject/Data/SettingModel.dart';
import 'package:cafeproject/design/fontColors/ProjectColors.dart';
import 'package:flutter/material.dart';
class settingDetails extends StatelessWidget {
  const settingDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("設定",style: TextStyle(color: Projectcolors.settingTitleColor)),
          shape: Border(
            bottom: BorderSide(
              color: Projectcolors.settingBottomLineColor,
              width: 0.95,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(0),
          color: Projectcolors.settingOptionColor,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 15,left: 14,bottom: 15),
                child: Text('アプリについて',style: TextStyle(color: Projectcolors.settingTitleColor.withOpacity(0.5),fontSize: 10)),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: settingList.length,
                    itemBuilder: (BuildContext context,int index) {
                      return ElevatedButton(
                        onPressed: () {

                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '이용가이드',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
