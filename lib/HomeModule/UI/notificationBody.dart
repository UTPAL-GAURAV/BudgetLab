import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:flutter/material.dart';

import '../../Shared/color_manager.dart';
import '../../Shared/constants_manager.dart';
import '../../Shared/service/common_service.dart';
import '../../Shared/widgets/widget_manager.dart';

/// Public Method //////////////////////////////////////////////////////////////

getNotificationBody() {
  return const NotificationBody();
}

/// Widget /////////////////////////////////////////////////////////////////////
class NotificationBody extends StatefulWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    String notification = "";
    return Expanded(
      child: Container(
        // height: height(0.2, context),
        width: screenWidth(0.9, context),
        margin: EdgeInsets.all(width(0.05, context)),
        padding: EdgeInsets.all(width(0.05, context)),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (notification == "")
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  getImageToDisplay("assets/images/stickers/notificationMonkey.png",
                      "assets/images/stickers/notificationMonkey.png", 0.2, 0.2, context),
                  SizedBox(height: 20,),
                  Text(
                    ConstantsManager.NO_NOTIFICATIONS,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorManager.LIGHT_GREY2, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
