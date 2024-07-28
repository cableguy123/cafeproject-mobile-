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
          title: const Text("정렬",style: TextStyle(color: Projectcolors.settingTitleColor)),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          color: Projectcolors.settingOptionColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1.사용방법",
                style: TextStyle(fontSize: 20,color: Projectcolors.settingTitleColor),
              ),
              Container(
                color: Colors.blue,
                margin: EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: settingList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      color: Colors.yellow,
                      width: 300,
                      height: 75,
                      child: Row(
                        children: [

                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
