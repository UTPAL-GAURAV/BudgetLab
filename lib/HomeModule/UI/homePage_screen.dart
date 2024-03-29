import 'package:budgetlab/HomeModule/UI/balanceBody.dart' as BalanceBody;
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/bottomNavigationBar.dart'
    as BottomNavigationBar;
import 'package:budgetlab/Shared/widgets/featuresTiles.dart' as FeaturesTiles;

import 'notificationBody.dart' as NotificationBody;

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(ConstantsManager.APP_NAME),
      // ),
      backgroundColor: ColorManager.BACKGROUND_GREY,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Stack(children: [
          Column(
            children: [
              BalanceBody.getBalanceBody(),
              FeaturesTiles.getFeaturesTiles(),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth(0.05, context), 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notifications",
                    style:
                    TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              NotificationBody.getNotificationBody(),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar.getBottomNavigationBar(),
    );
  }
}

screenHeight(double num, BuildContext context) {
  return MediaQuery.of(context).size.height * num;
}

screenWidth(double num, BuildContext context) {
  return MediaQuery.of(context).size.width * num;
}
