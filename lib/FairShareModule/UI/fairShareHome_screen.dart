
import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:budgetlab/Shared/service/notification_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/routes_manager.dart';
import '../../Shared/service/whatsapp_service.dart';
import 'fairShareGroups.dart';
import 'fairShareIndividuals.dart';

class FairShareHomeScreen extends StatefulWidget {
  const FairShareHomeScreen({Key? key}) : super(key: key);

  @override
  State<FairShareHomeScreen> createState() => _FairShareHomeScreenState();
}

class _FairShareHomeScreenState extends State<FairShareHomeScreen> {

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    // Notification
    notificationServices.requestNotificationPermission();
    notificationServices.isDeviceTokenRefreash();
    notificationServices.getDeviceToken().then((value) {
      print("Device Token");
      print(value);
    });

    // Whatsapp
    WhatsApp whatsapp = WhatsApp();
    whatsapp.setup(
      accessToken: "YOUR_ACCESS_TOKEN_HERE",
      fromNumberId: 919901502338,
    );
    whatsapp.messagesText(
        to: 919901502338,
        message: "Hey, download budgetLab. follow me on https://example.com",
        previewUrl: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fair Share"),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
        // Note: Needed because, not having it produces glitch on back button
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacementNamed(AppRouteConstants.home);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.group_add),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.createFairShareGroup);
            },
          ),
        ],
      ),

      body: Container(
        color: ColorManager.PRIMARY_BACKGROUND,
        width: MediaQuery.of(context).size.width,
        height: screenHeight(1.0, context) - AppBar().preferredSize.height,
        child: Padding(
            padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.01, context),
                screenWidth(0.02, context), screenHeight(0.01, context)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight(0.01, context), bottom: screenHeight(0.01, context)),
                    child: Text(
                      "Groups",
                      style:
                      TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: getFairShareGroups(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight(0.04, context), bottom: screenHeight(0.01, context)),
                    child: Text(
                      "Individual",
                      style:
                      TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: getFairShareIndividuals(),
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add, color: Colors.white),
        label: Text("Add Expense", style: TextStyle(color: Colors.white, fontSize: screenHeight(0.02, context))),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        onPressed: () {
          // FairShareController fairShareController = FairShareController();
          // fairShareController.someMethod('123456');
          GoRouter.of(context).pushNamed(AppRouteConstants.selectFairShareIndividual);
        },
      ),
    );
  }
}
