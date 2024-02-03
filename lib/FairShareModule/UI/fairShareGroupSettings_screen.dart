import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/message_manager.dart';
import '../../Shared/routes_manager.dart';
import '../../Shared/widgets/widget_manager.dart';
import '../FairShare_Entities/group_entity.dart';
import 'fairShareGroupMembers.dart';

class FairShareGroupSettings extends StatefulWidget {
  final Group group;
  FairShareGroupSettings({Key? key, required this.group}) : super(key: key);

  @override
  State<FairShareGroupSettings> createState() => _FairShareGroupSettingsState();
}

class _FairShareGroupSettingsState extends State<FairShareGroupSettings> {
  FairShareController fairShareController = FairShareController();
  bool isSwitchedSimplifyGroupDebts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Settings"),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(screenWidth(0.03, context), 0, 1, 0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Positioned.fill(
                    child: getImageToDisplay(widget.group.icon, ConstantsManager.EXPENSE_IMAGE,0.2, 0.3, context),
                  ),
                  Spacer(), // This will push the next widget to the right
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // GoRouter.of(context).pushNamed(AppRouteConstants.createFairShareGroup);
                    },
                  ),
                ],
              ),
            ),
            Row(children: [
              Text(
                widget.group.name,
                style: TextStyle(
                    color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
              ),
              Spacer(), // This will push the next widget to the right
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // GoRouter.of(context).pushNamed(AppRouteConstants.createFairShareGroup);
                },
              ),
            ]),
            Row(children: [
              Text(
                "Simplify Group Debts",
                style: TextStyle(
                    color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
              ),
              Spacer(), // This will push the next widget to the right
              CupertinoSwitch(
                  value: isSwitchedSimplifyGroupDebts,
                  onChanged: (bool newValue) {
                    setState(() {
                      isSwitchedSimplifyGroupDebts = newValue;
                    });
                  })
            ]),
            Divider(
              color: Colors.black,
              height: 4,
              thickness: 2,
            ),
            Text(
              "Group Members",
              style: TextStyle(
                  color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(AppRouteConstants.fairShareAddPeopleToGroup);
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  Expanded(
                    child: Text(
                      "  Add People to group",
                      style: TextStyle(
                          color: ColorManager.DARK_GREY,
                          fontSize: screenHeight(0.028, context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Share.share(getJoinFairShareGroupInviteMessage(widget.group));
              },
              child: Row(
                children: [
                  Icon(Icons.link),
                  Expanded(
                    child: Text(
                      "  Invite via link",
                      style: TextStyle(
                          color: ColorManager.DARK_GREY,
                          fontSize: screenHeight(0.028, context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            getFairShareGroupMembers(widget.group),
            GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  Text(
                    "  Leave Group",
                    style: TextStyle(
                        color: ColorManager.DARK_GREY,
                        fontSize: screenHeight(0.028, context),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                fairShareController.deleteGroup(0);
              },
              child: Row(
                children: [
                  Icon(Icons.delete),
                  Expanded(
                    child: Text(
                      "  Delete Group",
                      style: TextStyle(
                          color: ColorManager.DARK_GREY,
                          fontSize: screenHeight(0.028, context),
                          fontWeight: FontWeight.bold),
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
