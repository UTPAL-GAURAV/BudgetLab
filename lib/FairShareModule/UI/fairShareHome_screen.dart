
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/routes_manager.dart';
import 'fairShareGroups.dart';

class FairShareHomeScreen extends StatefulWidget {
  const FairShareHomeScreen({Key? key}) : super(key: key);

  @override
  State<FairShareHomeScreen> createState() => _FairShareHomeScreenState();
}

class _FairShareHomeScreenState extends State<FairShareHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fair Share"),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
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
                    child: getFairShareGroups(),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
