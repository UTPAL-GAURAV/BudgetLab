
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../color_manager.dart';

/// Public Method //////////////////////////////////////////////////////////////

getFeaturesTiles() {
  return const FeaturesTiles();
}


/// Widget /////////////////////////////////////////////////////////////////////

class FeaturesTiles extends StatefulWidget {
  const FeaturesTiles({Key? key}) : super(key: key);

  @override
  State<FeaturesTiles> createState() => _FeaturesTilesState();
}

class _FeaturesTilesState extends State<FeaturesTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(0.15, context),
      margin: EdgeInsets.all(screenWidth(0.05, context)),
      padding: EdgeInsets.all(screenWidth(0.05, context)),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getLoanLendIconTile(context),
            _getSavingsIconTile(context),
            getBudgetIconTile(context),
          ],
        )
      ,
    );
  }
}


/// ICON BUTTONS ///////////////////////////////////////////////////////////////

_getLoanLendIconTile(context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: screenWidth(0.2, context),
          child: FloatingActionButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            heroTag: "tag1",
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.fairShare);
            },
            backgroundColor: ColorManager.LIGHT_ORANGE,
            child: getImageToDisplay('assets/images/icons/group.png', 'assets/images/icons/group.png', 0.09, 0.09, context),
            // child: Icon(
            //   Icons.swap_horiz,
            //   color: ColorManager.DARK_ORANGE,
            //   size: 40,
            // ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ConstantsManager.SPLIT,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorManager.BLACK_VOID,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
}



_getSavingsIconTile(context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: screenWidth(0.2, context),
          child: FloatingActionButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            heroTag: "tag2",
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.savings);
            },
            backgroundColor: ColorManager.LIGHTER_GREEN,
            child: getImageToDisplay('assets/images/icons/jar.png', 'assets/images/icons/jar.png', 0.09, 0.09, context),
            // child: Icon(
            //   Icons.savings,
            //   color: ColorManager.DARKER_GREEN,
            //   size: 40,
            // ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ConstantsManager.SAVINGS,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorManager.BLACK_VOID,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
}

getBudgetIconTile(context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: screenWidth(0.2, context),
          child: FloatingActionButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            heroTag: "tag3",
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.budget);
            },
            backgroundColor: ColorManager.LIGHT_BLUE,
            child: getImageToDisplay('assets/images/icons/budget.png', 'assets/images/icons/budget.png', 0.09, 0.09, context),
            // child: Icon(
            //   Icons.receipt_long_sharp,
            //   color: ColorManager.DARK_BLUE,
            //   size: 40,
            // ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ConstantsManager.BUDGET,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorManager.BLACK_VOID,
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
}