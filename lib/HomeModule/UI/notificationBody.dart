import 'package:flutter/material.dart';

import '../../Shared/service/common_service.dart';

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
    return Expanded(
      child: Container(
        // height: height(0.2, context),
        margin: EdgeInsets.all(width(0.05, context)),
        padding: EdgeInsets.all(width(0.05, context)),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
      ),
    );
  }
}
