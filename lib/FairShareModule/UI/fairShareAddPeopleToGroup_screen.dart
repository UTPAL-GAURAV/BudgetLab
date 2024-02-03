
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';

class FairShareAddPeopleToGroupScreen extends StatefulWidget {
  const FairShareAddPeopleToGroupScreen({Key? key}) : super(key: key);

  @override
  State<FairShareAddPeopleToGroupScreen> createState() => _FairShareAddPeopleToGroupScreenState();
}

class _FairShareAddPeopleToGroupScreenState extends State<FairShareAddPeopleToGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add people to group"),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.connect_without_contact),
                  onPressed: () {
                    // GoRouter.of(context).pushNamed(AppRouteConstants.createFairShareGroup);
                  },
                ),
                Text(
                  "Add a new contact to FairShare",
                  style: TextStyle(
                      color: ColorManager.DARK_GREY,
                      fontSize: screenHeight(0.028, context),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "From your contacts",
              style: TextStyle(
                  color: ColorManager.DARK_GREY,
                  fontSize: screenHeight(0.028, context),
                  fontWeight: FontWeight.bold),
            ),
            // getUserContactList(),
          ],
        ),
      ),
    );
  }
}
