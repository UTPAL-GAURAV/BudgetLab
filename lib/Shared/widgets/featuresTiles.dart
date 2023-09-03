
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';

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
      height: height(0.15, context),
      margin: EdgeInsets.all(width(0.05, context)),
      padding: EdgeInsets.all(width(0.05, context)),
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
            getTransactionIconTile(context),
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
        FloatingActionButton(
          heroTag: "tag1",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: routes['/loanLend']!));
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.swap_horiz,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          ConstantsManager.LOAN_LEND,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorManager.BLACK_VOID,
            fontSize: 14,
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
        FloatingActionButton(
          heroTag: "tag2",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: routes['/savings']!));
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.savings,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          ConstantsManager.SAVINGS,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorManager.BLACK_VOID,
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
}

getTransactionIconTile(context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "tag3",
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: routes['/transactions']!));
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.receipt_long_sharp,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          ConstantsManager.INCOME_EXPENSE,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}