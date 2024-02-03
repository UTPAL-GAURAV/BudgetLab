import 'dart:io';

import 'package:budgetlab/FairShareModule/FairShare_Entities/friends_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/group_members_entity.dart';
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

getFairShareGroupMembers(Group group) {
  return FairShareGroupMembers(group: group);
}

/// Widget /////////////////////////////////////////////////////////////////////

class FairShareGroupMembers extends StatefulWidget {
  final Group group;
  FairShareGroupMembers({Key? key, required this.group}) : super(key: key);

  @override
  State<FairShareGroupMembers> createState() => _FairShareGroupMembersState();
}

class _FairShareGroupMembersState extends State<FairShareGroupMembers> {
  FairShareController fairShareController = FairShareController();

  List<Friends> groupMembersList = [];

  @override
  void initState() {
    groupMembersList = fairShareController.getAllFriendsOfThisGroup(widget.group.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: groupMembersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // GoRouter.of(context).pushNamed(AppRouteConstants.groupScreen, extra: groupList[index]);
            },
            child: Row(
              children: [
                Positioned.fill(
                  child: getImageToDisplay(groupMembersList[index].icon, ConstantsManager.EXPENSE_IMAGE, 0.2, 0.3, context),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth(0.05, context), screenWidth(0.05, context), 0, 0),
                  child: Text(
                    groupMembersList[index].name,
                    style: TextStyle(
                        color: ColorManager.BLACK_VOID,
                        fontSize: screenHeight(0.022, context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
