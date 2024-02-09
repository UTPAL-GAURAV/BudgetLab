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
        padding: EdgeInsets.fromLTRB(screenWidth(0.03, context), screenWidth(0.03, context), screenWidth(0.03, context), 0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  getImageToDisplay(widget.group.icon, ConstantsManager.EXPENSE_IMAGE, 0.2, 0.2, context),
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
            Padding(
              padding: const EdgeInsets.only(top: 14.0, bottom: 12),
              child: Row(children: [
                Text(
                  widget.group.name,
                  style: TextStyle(
                      color: ColorManager.BLACK_FADED, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
                ),
                Spacer(), // This will push the next widget to the right
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // GoRouter.of(context).pushNamed(AppRouteConstants.createFairShareGroup);
                  },
                ),
              ]),
            ),
            Row(children: [
              Text(
                "Simplify Group Debts",
                style: TextStyle(
                    color: ColorManager.BLACK_FADED, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
              ),
              Spacer(), // This will push the next widget to the right
              CupertinoSwitch(
                  value: isSwitchedSimplifyGroupDebts,
                  onChanged: (bool newValue) {
                    setState(() {
                      isSwitchedSimplifyGroupDebts = newValue;
                    });
                  }),
            ]),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Divider(
              color: ColorManager.DARK_GREY,
              thickness: 1,
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
              onTap: () {
                _showLeaveGroupSlideUpWidget(context, fairShareController, widget.group.id);
              },
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

            // Delete group is not needed and people can leave
          ],
        ),
      ),
    );
  }
}

void _showLeaveGroupSlideUpWidget(BuildContext context, FairShareController fairShareController, int groupId) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 170,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
            Container(
              height: 6,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              'Leave Group?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Are you sure you want to leave this group?',
                  style: TextStyle(fontSize: 17,),
                )),
            Padding(padding: EdgeInsets.only(top: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    fairShareController.deleteGroup(groupId);
                    // TODO: Delete group from firebase if last member
                    GoRouter.of(context).pushNamed(AppRouteConstants.fairShare);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: ColorManager.CHILLY_PEPPER,
                      ),
                      Text(
                        "  Leave Group",
                        style: TextStyle(
                            color: ColorManager.CHILLY_PEPPER,
                            fontSize: screenHeight(0.028, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "  Cancel      ",
                    style: TextStyle(
                        color: ColorManager.PRIMARY_BLUE,
                        fontSize: screenHeight(0.028, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
