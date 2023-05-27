import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:budgetlab/Shared/service/avatar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/widgets/bottomNavigationBar.dart' as BottomNavigationBar;

import '../../Shared/constants_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState() {
    RoutesManager.currentBottomNavigationBarIndex = 4;
    super.initState();
  }

  @override
  void dispose() {
    RoutesManager.currentBottomNavigationBarIndex = 0;
    super.dispose();
  }

  bool isSwitchedHide = false;

  AvatarService avatarService = AvatarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsManager.APP_NAME),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/avatars/neutralGreenHair.jpg'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Hello User",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              "user@gmail.com",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FilledButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
                fixedSize: MaterialStateProperty.all<Size>(const Size(180, 50)),
                alignment: Alignment.center,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,0,12,0),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22,)
                ],
              ),
            ),
          ),
          WidgetManager.getHeaderDividerSizedBox(ConstantsManager.PREFERENCES),
          Row(
            children: [
              const Text("Hide"),
              CupertinoSwitch(
                  value: isSwitchedHide,
                  onChanged: (bool newValue) {
                    setState(() {
                      isSwitchedHide = newValue;
                    });
                  })
            ],
          ),
          Row(
            children: const [
              Text("Currency"),
            ],
          ),
          WidgetManager.getHeaderDividerSizedBox(ConstantsManager.MORE),
          Row(
            children: const [
              Text("FAQ"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar.getBottomNavigationBar(),
    );
  }
}
