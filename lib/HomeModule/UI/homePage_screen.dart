import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/bottomNavigationBar.dart' as BottomNavigationBar;
import 'package:budgetlab/Shared/widgets/piggyBalanceTile.dart' as PiggyBalanceTile;
import 'package:budgetlab/Shared/widgets/featuresTiles.dart' as FeaturesTiles;

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsManager.APP_NAME),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Column(
          children: [
            PiggyBalanceTile.getPiggyBalanceTile(),
            const Divider(),
            FeaturesTiles.getFeaturesTiles(),
            const Divider(),
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  Text("Notifications"),
                ],
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar.getBottomNavigationBar(),
    );
  }
}
