import 'dart:io';

import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/routes_manager.dart';
import '../../Shared/service/common_service.dart';

/// Public Method //////////////////////////////////////////////////////////////

getFairShareGroups() {
  return const FairShareGroups();
}

/// Widget /////////////////////////////////////////////////////////////////////

class FairShareGroups extends StatefulWidget {
  const FairShareGroups({Key? key}) : super(key: key);

  @override
  State<FairShareGroups> createState() => _FairShareGroupsState();
}

class _FairShareGroupsState extends State<FairShareGroups> {
  FairShareController fairShareController = FairShareController();

  List<Group> groupList = [];

  @override
  void initState() {
    groupList = fairShareController.getAllGroupList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: groupList.length,
        itemBuilder: (context, index) {
          if (groupList[index].isGroup) {
            double amountStatus = groupList[index].amountStatus;
            String path = groupList[index].icon;
            String message = amountStatus < 0
                ? "You owe ${amountStatus}"
                : amountStatus == 0
                    ? "settled up"
                    : "You are owed: ${amountStatus}";

            return GestureDetector(
              onTap: () {
                // GoRouter.of(context).pushNamed(AppRouteConstants.budgetOverview, extra: groupList[index]);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, screenHeight(0.016, context)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: getRandomLightColor(groupList[index].name).withOpacity(0.7),
                      blurRadius: 5,
                      offset: const Offset(4, 8), // shadow position
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        // Ensure image is clipped to the container's border
                        child: path.startsWith('assets/')
                            ? Image.asset(
                                path,
                                fit: BoxFit.fill,
                                height: screenWidth(0.2, context),
                                width: screenWidth(0.3, context), // Ensure the image covers the entire container
                              )
                            : File(path).existsSync() // Check if the file exists
                                ? Image.file(
                                    File(path),
                                    fit: BoxFit.cover,
                                    height: screenWidth(0.2, context),
                                    width: screenWidth(0.3, context), // Ensure the image covers the entire container
                                  )
                                // In case user deletes File path image
                                : Image.asset(
                                    'assets/images/icons/budgetCategory/piggy.png', // Path to your default image in the assets folder
                                    fit: BoxFit.fill,
                                    height: screenWidth(0.2, context),
                                    width: screenWidth(0.3, context), // Ensure the image covers the entire container
                                  ),
                      ),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.05, context), screenWidth(0.05, context), 0, 0),
                        child: Text(
                          groupList[index].name,
                          style: TextStyle(
                              color: ColorManager.BLACK_VOID,
                              fontSize: screenHeight(0.022, context),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.05, context), screenWidth(0.02, context), 0, screenWidth(0.05, context)),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: ColorManager.GREY,
                              fontSize: screenHeight(0.018, context),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
