import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:budgetlab/Shared/service/avatar_service.dart';
import 'package:budgetlab/Shared/service/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/widgets/bottomNavigationBar.dart' as BottomNavigationBar;

import '../../Shared/color_manager.dart';
import '../../Shared/constants_manager.dart';
import '../../Shared/widgets/widget_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  LoginService loginService = LoginService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _firebaseAuth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isSwitchedHide = false;

  AvatarService avatarService = AvatarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsManager.PROFILE),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: getImageToDisplay(
                      _user?.photoURL?? 'assets/images/avatars/neutralGreenHair.jpg', 'assets/images/avatars/neutralGreenHair.jpg', 0.5, 0.5, context),
                ),
              )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Hello User",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              _user == null ? "Login to unlock more features" : _user!.email!,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          //TODO: When not signed in show login buttons, else show logout button
          _user == null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      loginService.appleSignInButton(_firebaseAuth),
                      loginService.googleSignInButton(_firebaseAuth)
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FilledButton(
                    onPressed: () async {
                      await _firebaseAuth.signOut();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      fixedSize: MaterialStateProperty.all<Size>(const Size(180, 50)),
                      alignment: Alignment.center,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                          child: Text(
                            "Logout",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 22,
                        )
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
