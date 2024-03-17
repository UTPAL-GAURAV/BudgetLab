import 'dart:io';

import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/constants_manager.dart';
import '../../Shared/routes_manager.dart';
import '../../Shared/service/common_service.dart';
import '../../Shared/widgets/widget_manager.dart';

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
  bool isGroupAvailable = false;

  @override
  void initState() {
    groupList = fairShareController.getAllGroupList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Case 1: When groupList is empty
    // Case 2: When groupList is not empty but isGroup is 0
    if (groupList.isEmpty) {
      return getNoGroupAvailableBody();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: groupList.length,
          itemBuilder: (context, index) {
            if (groupList[index].isGroup) {
              isGroupAvailable = true;
              double amountStatus = groupList[index].amountStatus;
              String path = groupList[index].icon;
              String message = amountStatus < 0
                  ? "You owe ${amountStatus}"
                  : amountStatus == 0
                      ? "settled up"
                      : "You are owed: ${amountStatus}";

              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRouteConstants.groupScreen, extra: groupList[index]);
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.04, context), 0, screenWidth(0.04, context), 0),
                        child: SizedBox(
                          height: screenHeight(0.09, context),
                          width: screenHeight(0.09, context),
                          child: getImageToDisplay(path, ConstantsManager.EXPENSE_IMAGE, 0.2, 0.3, context),
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
                          padding: EdgeInsets.fromLTRB(
                              screenWidth(0.05, context), screenWidth(0.02, context), 0, screenWidth(0.05, context)),
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
            } else if (index == groupList.length - 1 && !isGroupAvailable) {
              return getNoGroupAvailableBody();
            } else {
              return Container();
            }
          });
    }
  }

  getNoGroupAvailableBody() {
    return Container(
        width: screenWidth(0.9, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), // Adjust opacity as needed
                BlendMode.srcATop,
              ),
              child: getImageToDisplay(
                  'assets/images/stickers/moneyTeam.png', 'assets/images/stickers/moneyTeam.png', 0.3, 0.3, context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                ConstantsManager.NO_SPLIT_GROUPS,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorManager.FLUTTER_BLUE, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
